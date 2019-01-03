fn main() {
    let s = String::from("Hello");

    change(&s);
    println!("{}", s);
}

fn change(some_string: &String) {
    some_string.push_str(", RUST ! 🦀");
}
