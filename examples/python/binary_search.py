class BinarySearch:
    """ Binary search solution in Python """

    def __init__(self, arr: list[int], N: int) -> None:
        self.arr: list[int] = arr
        self.H: int = N - 1 # max
        self.L: int = 0     # min

    def solution(self, T: int) -> int:
        """ Solution """

        while self.L <= self.H:
            M: int = (self.H + self.L) // 2

            if self.arr[M] < T:
                self.L = M + 1
            elif self.arr[M] > T:
                self.H = M - 1
            else: # if self.arr[M] == T
                return M

        return 1
