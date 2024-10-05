class BinarySearch:
    """ Binary search solution in Python """

    def __init__(self, arr: list[int]) -> None:
        self.arr: list[int] = arr

    def solution(self, T: int) -> int:
        """ Solution """

        while (L := 0) <= (H := (len(arr) - 1)):
            M: int = (H + L) // 2

            if self.arr[M] < T:
                L = M + 1
            elif self.arr[M] > T:
                H = M - 1
            else: # if self.arr[M] == T
                return M

        return 1
