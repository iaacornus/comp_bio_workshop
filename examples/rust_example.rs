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

        // loop over range of 1 to 4 and print hello world!
        for i in 1..4 {
            println!(
                "{} hello world!", i
            );
        }
    }
}
