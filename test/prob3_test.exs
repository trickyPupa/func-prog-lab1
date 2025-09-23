defmodule LargestPrimeFactorTest do
  use ExUnit.Case
  doctest LargestPrimeFactor

  test "recursion method" do
    assert LargestPrimeFactor.Recursion.solve(600_851_475_143) == 6857
    assert LargestPrimeFactor.Recursion.solve(2) == 2
    assert LargestPrimeFactor.Recursion.solve(1024) == 2
    assert LargestPrimeFactor.Recursion.solve(113) == 113
    assert LargestPrimeFactor.Recursion.solve(13_195) == 29
  end

  test "tail recursion method" do
    assert LargestPrimeFactor.TailRecursion.solve(600_851_475_143) == 6857
  end

  test "is prime function" do
    assert LargestPrimeFactor.prime?(6857)
    assert not LargestPrimeFactor.prime?(9997)
  end

  test "module method" do
    assert LargestPrimeFactor.Module.solve(600_851_475_143) == 6857
  end

  test "map method" do
    assert LargestPrimeFactor.Map.solve(600_851_475_143) == 6857
  end

  test "loop method" do
    assert LargestPrimeFactor.Loop.solve(600_851_475_143) == 6857
  end

  test "lazy method" do
    assert LargestPrimeFactor.Lazy.solve(600_851_475_143) == 6857
  end
end
