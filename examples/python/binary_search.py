class BinarySearch:
    """ Binary search solution in python """

    def __init__(self, arr: list[int], n: int) -> None:
        self.arr: list[int] = arr
        self.H: int = n - 1
        self.L: int = 0

    def solution(self, T: int) -> int:
        while self.L <= self.H:
            M: int = (self.H + self.L) // 2
            if self.arr[M] == T:
                return M

            if self.arr[M] < T:
                self.L = M + 1
            else:
                self.H = M - 1

        return -1
