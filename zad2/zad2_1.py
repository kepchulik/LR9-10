import random

N = 6  
M = 8  

a = [[0] * M for _ in range(N)]  
b = [0] * N                     


def fill_array():
    """Заполнить массив a случайными числами от -10 до 10."""
    random.seed()
    for i in range(N):
        for j in range(M):
            a[i][j] = random.randint(-10, 10)


def print_array_2d():
    """Напечатать двумерный массив a."""
    print('Двумерный массив:')
    for i in range(N):
        for j in range(M):
            print(f"{a[i][j]:4d}", end="")
        print()  


def create_array_b():
    """Сформировать массив b по условию |a[i, j]| > 4."""
    for i in range(N):
        b[i] = 0          
        for j in range(M):
            if abs(a[i][j]) > 4:
                b[i] = a[i][j]  
                break           


def print_array_1d():
    """Напечатать одномерный массив b."""
    print('Одномерный массив:')
    for i in range(N):
        print(f"{b[i]:4d}", end="")
    print()  


def main():
    fill_array()
    print_array_2d()
    create_array_b()
    print_array_1d()


if __name__ == "__main__":
    main()
