defmodule LargestPrimeFactor do
  def prime?(n) when not is_integer(n) or n < 2, do: false

  def prime?(n) when n < 4, do: true

  def prime?(n) do
    range = 2..round(n ** 0.5)
    Enum.all?(range, &(rem(n, &1) != 0))
  end

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

  defmodule Recursion do
    def solve(n) when not is_integer(n) or n < 3, do: n

    def solve(n) do
      if LargestPrimeFactor.prime?(n) do
        n
      else
        factors = factorize(n, 2)
        Enum.max(factors)
      end
    end

    defp factorize(n, i) when i * i > n do
      []
    end

    defp factorize(n, i) when rem(n, i) == 0 do
      if LargestPrimeFactor.prime?(i) do
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
      Enum.filter(range, &(rem(n, &1) == 0)) ++ [n]
    end

    defp filter(factors) do
      Enum.filter(factors, &LargestPrimeFactor.prime?/1)
    end

    def solve(n) when not is_integer(n) or n < 3, do: n

    def solve(n) do
      n
      |> generate_factors()
      |> filter()
      |> Enum.reduce(1, fn elem, acc -> if elem > acc, do: elem, else: acc end)
    end
  end

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

  defmodule Loop do
    def solve(n) when not is_integer(n) or n < 3, do: n

    def solve(n) do
      factors =
        for i <- 2..round(n ** 0.5), rem(n, i) == 0 and LargestPrimeFactor.prime?(i), do: i

      Enum.max(factors, &>=/2, fn -> n end)
    end
  end

  defmodule Map do
    def solve(n) when not is_integer(n) or n < 3, do: n

    def solve(n) do
      2..round(n ** 0.5)
      |> Stream.map(fn x -> if rem(n, x) == 0, do: x, else: nil end)
      |> Stream.map(fn x ->
        if is_number(x) and LargestPrimeFactor.prime?(x), do: x, else: nil
      end)
      |> Stream.filter(& &1)
      |> Enum.max(&>=/2, fn -> n end)
    end
  end
end
