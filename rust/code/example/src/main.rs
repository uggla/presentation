extern crate flate2;

use flate2::read::GzDecoder;
use std::fs::File;
use std::io::Read;

fn run() -> String {
    let path = "ascii.txt.gz";
    let mut contents = String::new();
    let gz = File::open(path).unwrap(); // open and decompress file
    let mut uncompress = GzDecoder::new(gz);
    uncompress.read_to_string(&mut contents).unwrap();
    contents // return implicitly contents
}

fn main() {
    println!("Hello, world!");
    let result = run(); // call run function
    println!("{}", result); // display compress file content
}
