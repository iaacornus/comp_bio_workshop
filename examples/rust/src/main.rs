fn main() {
    /* this is a comment */
    // this is ignored
    // declare a variable
    let hello = String::from("hello world!");

    // compare this variable to a string
    if hello == "hello world!" {
        println!(
            "The tradition in programming is to print"
        );
        println!(
            "Hello World! Like this in Python, {}", hello
        );
    } else {
        println!(
            "It seems that it is not hello world :("
        );
    }
}
