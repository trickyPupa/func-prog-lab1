defmodule LargestPrimeFactor do
  def is_prime?(1), do: false

  def is_prime?(n) do
    range = 2..round(n ** 0.5)
    Enum.all?(range, &(rem(n, &1) != 0))
  end

  defmodule TailRecursion do
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

  defmodule Recursion do
    def solve(n) do
      factors = factorize(n, 2)
      Enum.max(factors)
    end

    defp factorize(n, i) when i * i > n do
      []
    end

    defp factorize(n, i) when rem(n, i) == 0 do
      if factorize(i, 2) == [] do
        [i | factorize(n, i + 1)]
      else
        factorize(n, i + 1)
      end
    end

    defp factorize(n, i) do
      factorize(n, i + 1)
    end
  end

  defmodule Module do
    defp generate_factors(n) do
      range = 2..round(n ** 0.5)
      Enum.filter(range, &(rem(n, &1) == 0))
    end

    defp filter(factors) do
      Enum.filter(factors, &LargestPrimeFactor.is_prime?/1)
    end

    def solve(n) do
      n
      |> generate_factors()
      |> filter()
      |> Enum.reduce(1, fn elem, acc -> if elem > acc, do: elem, else: acc end)
    end
  end

  defmodule Lazy do
    def solve(n) do
      Stream.iterate(2, &(&1 + 1))
      |> Stream.take_while(&(&1 * &1 <= n))
      |> Stream.filter(&(rem(n, &1) == 0))
      |> Stream.filter(&LargestPrimeFactor.is_prime?/1)
      |> Enum.max()
    end
  end

  defmodule SpecialLoop do
    def solve(n) do
      factors =
        for i <- 2..round(n ** 0.5), rem(n, i) == 0 and LargestPrimeFactor.is_prime?(i), do: i

      Enum.max(factors)
    end
  end

  defmodule Map do
    def solve(n) do
      2..round(n ** 0.5)
      |> Stream.map(fn x -> if rem(n, x) == 0, do: x, else: nil end)
      |> Stream.map(fn x ->
        if is_number(x) and LargestPrimeFactor.is_prime?(x), do: x, else: nil
      end)
      |> Stream.filter(& &1)
      |> Enum.max()
    end
  end
end
