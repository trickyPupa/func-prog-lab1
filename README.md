# Лабораторная работа №1

## Лабор Тимофей Владимирович P3325

## Описание задач

**Цель:** освоить базовые приёмы и абстракции функционального программирования: функции, поток управления и поток данных, сопоставление с образцом, рекурсия, свёртка, отображение, работа с функциями как с данными, списки.

**Вариант:** 3, 28

[**Задача 3:**](https://projecteuler.net/problem=3)

> The prime factors of $13195$ are $5, 7, 13$ and $29$.
> What is the largest prime factor of the number $600851475143$?

[**Задача 28:**](https://projecteuler.net/problem=28)

> Starting with the number $1$ and moving to the right in a clockwise direction a $5$ by $5$ spiral is formed as follows:
>
> | | | | | |
> | - | - | - | - | - |
> | **21** | 22 | 23 | 24 | **25** |
> | 20 | **7**  | 8  | 9  | 10 |
> | 19 | 6  | **1**  | 2  | 11 |
> | 18 | **5**  | 4  | **3**  | 12 |
> | **17** | 16 | 15 | 14 | **13** |
>
> It can be verified that the sum of the numbers on the diagonals is $101$.
> What is the sum of the numbers on the diagonals in a $1001$ by $1001$ spiral formed in the same way?

## Выполнение

### Ключевые элементы реализации

#### Задача 3

**Первый способ** решения подразумевает деление исходного числа на простые делители до тех пор пока оно не станет равно 1. Последний делитель и будет наибольшим простым.

Пример реализации с помощью хвостовой рекурсии:

```elixir
defmodule TailRecursion do
    def solve(n) when not is_integer(n) or n < 3, do: n

    def solve(number) when number > 1 do
        solve(number, 2)
    end

    defp solve(1, fact) do
        fact
    end

    defp solve(number, fact) when rem(number, fact) == 0 do
        solve(div(number, fact), fact)
    end

    defp solve(number, fact) do
        solve(number, fact + 1)
    end
end
```

Пример реализации на языке Python в императивном стиле:

```python
def solve(n):
    i = 2
    largest = 0
    init_n = n
    while i * i <= init_n:
        if n % i == 0:
            while n % i == 0:
                n //= i
            largest = i
        i += 1
    
    if largest == 0:
        largest = n
    
    return largest
```

**Второй способ:** перебор всех делителей числа и проверка их на простоту. Наибольший из таких - искомое число.

Пример реализации с помощью ленивых коллекций:

```elixir
  defmodule Lazy do
    def solve(n) when not is_integer(n) or n < 3, do: n

    def solve(n) do
      Stream.iterate(2, &(&1 + 1))
      |> Stream.take_while(&(&1 * &1 <= n))
      |> Stream.filter(&(rem(n, &1) == 0))
      |> Stream.filter(&LargestPrimeFactor.prime?/1)
      |> Enum.max(&>=/2, fn -> n end)
    end
  end
```

#### Задача 28

Можно разложить матрицу на слои и заметить, что за исключением первого слоя (единица в центре) каждый слой вносит в искомую сумму 4 числа - углы матрицы, значение которых можно вычислить из значения номера слоя. Формулы для угловых значений слоя матрицы: $$n*n, n*n - (n - 1), n*n - 2 * (n - 1), n*n - 3 * (n - 1)$$

Пример реализации при помощи отображения:

```elixir
defmodule Map do
    def solve(n) when not is_integer(n) or rem(n, 2) == 0, do: 0

    def solve(n) do
        sum =
        3..n//2
        |> Stream.flat_map(fn x ->
            [x * x, x * x - (x - 1), x * x - 2 * (x - 1), x * x - 3 * (x - 1)]
        end)
        |> Enum.sum()

        sum + 1
    end
end
```

Пример на языке Python в императивном стиле:

```python
def diagonal_sum(n):
    if n == 1:
        return 1
    
    total = 1
    for i in range(3, n + 1, 2):
        corners = [
            i*i,
            i*i - (i - 1),
            i*i - 2 * (i - 1),
            i*i - 3 * (i - 1)
        ]
        total += sum(corners)
    
    return total
```

### Выводы

Функциональный стиль требует некоторого время на перестройку мышления после других языков программирования. Самыми удобными мне показались решения (благодаря оператору конвейера [pipe operator] и анонимным функцям), использующие ленивые коллекции (Stream), их легко понять, они имеют интуитивный синтаксис. Самый эффективный же способ это хвостовая рекурсия, однако к написанию программ таким образом надо привыкнуть.

### Тестовое покрытие

|Percentage | Module|
|-----------|--------------------------|
| 75.00% | LargestPrimeFactor|
|100.00% | LargestPrimeFactor.Lazy|
|100.00% | LargestPrimeFactor.Loop|
|100.00% | LargestPrimeFactor.Map|
|100.00% | LargestPrimeFactor.Module|
|100.00% | LargestPrimeFactor.Recursion|
|100.00% | LargestPrimeFactor.TailRecursion|
|100.00% | NumberSpiralDiagonals|
|100.00% | NumberSpiralDiagonals.Lazy|
|100.00% | NumberSpiralDiagonals.Loop|
|100.00% | NumberSpiralDiagonals.Map|
|100.00% | NumberSpiralDiagonals.Module|
|100.00% | NumberSpiralDiagonals.Recursion|
|100.00% | NumberSpiralDiagonals.TailRecursion|
|---|---|
|**98.44%**  | **Total** |
