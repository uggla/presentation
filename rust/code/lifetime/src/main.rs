#[derive(Debug)]
struct Person<'a> {
    first_name: &'a str,
    last_name: &'a str,
    age: &'a i32,
    phone: Vec<&'a str>,
}
fn return_reference<'a>() -> Person<'a> {
    let age = 25;
    Person {
        first_name: "John",
        last_name: "Doe",
        age: &age,
        phone: vec!["123-123", "456-456"],
    }
}

fn main() {
    let person = return_reference();
    println!("{:?}", person);
}
