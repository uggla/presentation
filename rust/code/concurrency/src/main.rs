use std::collections::HashMap;
use std::fs::File;
use std::io::Read;
use std::sync::Arc;
use std::sync::Mutex;
use std::thread;
use std::time::Duration;

fn run(files: Vec<String>) -> HashMap<String, String> {
    //fn run(files: Vec<String>) {
    let counter = Arc::new(Mutex::new(HashMap::new()));
    let mut handles = vec![];
    for file in files {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            println!("hi number {} from the spawned thread!", file);
            let mut filehandle = File::open(&file).expect("Cannot open file !");
            let mut contents = String::new();
            filehandle
                .read_to_string(&mut contents)
                .expect("Cannot read file !");
            contents.pop(); // Remove \n
            println!("Content: {}", contents);
            thread::sleep(Duration::from_millis(1));
            let mut map = counter.lock().unwrap();
            map.insert(file, contents);
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    Arc::try_unwrap(counter).unwrap().into_inner().unwrap()
}

fn main() {
    println!("Hello, world!");
    //let mut map = HashMap::new();
    let files = vec![
        "1.txt".to_string(),
        "2.txt".to_string(),
        "3.txt".to_string(),
    ];

    //map.insert("Flosscon day1".to_string(), "27th January 2019".to_string());
    let map = run(files);

    for (key, value) in map.iter() {
        println!("{}, {}", key, value);
    }
}