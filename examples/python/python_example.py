def main() -> int:
    """ this is a docstring """
    # but this is a comment
    # this is ignored
    # this is a variable
    hello: str = "hello world!"

    # compare this variable to a string
    if hello == "hello world!":
        print("The tradition in programming is to print")
        print(f"Hello World! Like this in Python, {hello}")

    return 0

if __name__ == "__main__":
    main()
