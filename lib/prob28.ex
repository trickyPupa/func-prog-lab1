defmodule NumberSpiralDiagonals do
  defmodule Recursion do
    def solve(n) when not is_integer(n) or rem(n, 2) == 0, do: 0

    def solve(1) do
      1
    end

    def solve(n) do
      summands = [
        n * n,
        n * n - (n - 1),
        n * n - 2 * (n - 1),
        n * n - 3 * (n - 1)
      ]

      Enum.sum(summands) + solve(n - 2)
    end
  end

  defmodule TailRecursion do
    def solve(n) when not is_integer(n) or rem(n, 2) == 0, do: 0

    def solve(n) do
      do_solve(n, 3, 0) + 1
    end

    defp do_solve(n, current, sum) when n + 1 < current do
      sum
    end

    defp do_solve(n, current, sum) do
      summands = [
        current * current,
        current * current - (current - 1),
        current * current - 2 * (current - 1),
        current * current - 3 * (current - 1)
      ]

      do_solve(n, current + 2, sum + Enum.sum(summands))
    end
  end

  defmodule Lazy do
    def solve(n) when not is_integer(n) or rem(n, 2) == 0, do: 0

    def solve(n) do
      sum =
        Stream.iterate(3, &(&1 + 2))
        |> Stream.take_while(&(&1 <= n))
        |> Stream.flat_map(fn x ->
          [x * x, x * x - (x - 1), x * x - 2 * (x - 1), x * x - 3 * (x - 1)]
        end)
        |> Enum.sum()

      sum + 1
    end
  end

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

  defmodule Loop do
    def solve(n) when not is_integer(n) or rem(n, 2) == 0, do: 0

    def solve(n) do
      list =
        for x <- 3..n//2 do
          x * x + (x * x - (x - 1)) + (x * x - 2 * (x - 1)) + (x * x - 3 * (x - 1))
        end

      Enum.sum(list) + 1
    end
  end

  defmodule Module do
    def solve(n) when not is_integer(n) or rem(n, 2) == 0, do: 0

    def solve(n) do
      generate_range(n)
      |> Enum.reduce(1, &(&1 + &2))
    end

    defp generate_range(n) do
      3..n//2
      |> Enum.flat_map(&values/1)
    end

    defp values(n) do
      [
        n * n,
        n * n - (n - 1),
        n * n - 2 * (n - 1),
        n * n - 3 * (n - 1)
      ]
    end
  end
end
