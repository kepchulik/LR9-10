#ПРОЦЕДУРА ПОИСКА МАКСИМУМА
def find_max(a):                      # a — параметр (передача по значению)
    max_val = a[0]
    max_index = 0

    for i in range(1, len(a)):
        if a[i] > max_val:
            max_val = a[i]
            max_index = i

    return max_val, max_index         # возврат значений


#ПРОЦЕДУРА ПОИСКА ЭЛЕМЕНТА С МИНИМАЛЬНЫМ МОДУЛЕМ
def find_min_abs(a):                  # a — параметр (передача по значению)
    min_abs_index = 0
    min_abs_val = abs(a[0])

    for i in range(1, len(a)):
        if abs(a[i]) < min_abs_val:
            min_abs_val = abs(a[i])
            min_abs_index = i

    return a[min_abs_index], min_abs_index


#ПРОЦЕДУРА ПОИСКА МАКСИМАЛЬНОГО ОТРИЦАТЕЛЬНОГО
def find_max_negative(a):             # a — параметр (передача по значению)
    max_neg_index = -1
    found = False

    for i in range(len(a)):
        if a[i] < 0:
            max_neg_val = a[i]
            max_neg_index = i
            found = True
            break

    if found:
        for i in range(max_neg_index + 1, len(a)):
            if a[i] < 0 and a[i] > max_neg_val:
                max_neg_val = a[i]
                max_neg_index = i
        return max_neg_val, max_neg_index
    else:
        return 0, -1


#ОСНОВНАЯ ПРОГРАММА
n = int(input("Введите размер массива: "))   # глобальная переменная
arr = []                                     # глобальный массив

print("Введите элементы массива:")
for _ in range(n):
    arr.append(float(input()))

#ФАКТИЧЕСКИЕ ПАРАМЕТРЫ
max_val, max_index = find_max(arr)
print(f"Максимальный элемент: {max_val:.2f} с индексом {max_index}")

min_abs_val, min_abs_index = find_min_abs(arr)
print(f"Минимальный по модулю элемент: {min_abs_val:.2f} с индексом {min_abs_index}")

max_neg_val, max_neg_index = find_max_negative(arr)
if max_neg_index != -1:
    print(f"Максимальный отрицательный элемент: {max_neg_val:.2f} с индексом {max_neg_index}")
else:
    print("Отрицательных элементов нет")
