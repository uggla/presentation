use std::collections::HashMap;
use std::fs::File;
use std::io::Read;
use std::sync::Arc;
use std::sync::Mutex;
use std::thread;
use std::time::Duration;

fn run(files: Vec<String>) -> HashMap<String, String> {
    let hasmap = Arc::new(Mutex::new(HashMap::new()));
    let mut handles = vec![];
    for file in files {
        let hasmap = Arc::clone(&hasmap);
        let handle = thread::spawn(move || {
            println!("Processing file: {}", file);
            let mut filehandle = File::open(&file).expect("Cannot open file !");
            let mut contents = String::new();
            filehandle
                .read_to_string(&mut contents)
                .expect("Cannot read file !");
            contents.pop(); // Remove \n
            hasmap.lock().unwrap().insert(file, contents); // Lock and insert into the HashMap
            thread::sleep(Duration::from_millis(10)); // Sleep thread for fun
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    Arc::try_unwrap(hasmap).unwrap().into_inner().unwrap()
}

fn main() {
    println!("Read file contents:");
    let files = vec![
        "1.txt".to_string(),
        "2.txt".to_string(),
        "3.txt".to_string(),
    ];

    let map = run(files);

    for (key, value) in map.iter() {
        println!("File: '{}', Contents: '{}'", key, value);
    }
}
