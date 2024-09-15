class Main[Example]:
    """ Main object """
    def __init__(self) -> None:
        pass

    def main(self) -> int:
        """ this is a docstring """
        # this is ignored
        # this is a variable
        hello: str = "hello world!"

        # compare this variable to a string
        if hello == "hello world!":
            print("The tradition in programming is to print")
            print(f"Hello World! Like this in Python, {hello}")

            for i in range(1, 4):
                print(f"{i} Hello world!")

        return 0

if __name__ == "__main__":
    Main().main()
