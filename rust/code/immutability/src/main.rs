struct Bike {
    speed: u32,
    distance: u32,
    brand: String,
}

fn main() {
    let mybike = Bike {
        speed: 25,
        distance: 1508,
        brand: "Liteville".to_string(),
    };

    mybike.speed = 30; //Reassign !!!

    println!(
        "Bike {}: speed={} distance={}",
        mybike.brand, mybike.speed, mybike.distance
    );
}
