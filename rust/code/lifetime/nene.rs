#[derive(Debug)]
struct Person<'a> {
    first_name: &'a str,
    last_name: &'a str,
    phone: Vec<&'a str>,
}

fn return_reference<'a>() -> Person<'a> {
    let name = "John".to_string();

    Person {
        first_name: &name,
        last_name: "Doe",
        phone: vec!["123-123", "456-456"],
    }
}

fn main() {
    let person = return_reference();
    println!("{:?}", person);
}
