fn main() {
    let s = String::from("Hello, RUST ! 🦀");

    display(&s);
    display(&s);
}

fn display(some_string: &String) {
    println!("{}", some_string);
}
