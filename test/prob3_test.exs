defmodule LargestPrimeFactorTest do
  use ExUnit.Case
  doctest LargestPrimeFactor

  @data %{600_851_475_143 => 6857, 2 => 2, 1024 => 2, 113 => 113, 13_195 => 29}

  test "recursion method" do
    for key <- Map.keys(@data) do
      assert LargestPrimeFactor.Recursion.solve(key) == @data[key]
    end
  end

  test "tail recursion method" do
    for key <- Map.keys(@data) do
      assert LargestPrimeFactor.TailRecursion.solve(key) == @data[key]
    end
  end

  test "is prime function" do
    assert LargestPrimeFactor.prime?(6857)
    assert not LargestPrimeFactor.prime?(9997)
  end

  test "module method" do
    for key <- Map.keys(@data) do
      assert LargestPrimeFactor.Module.solve(key) == @data[key]
    end
  end

  test "map method" do
    for key <- Map.keys(@data) do
      assert LargestPrimeFactor.Map.solve(key) == @data[key]
    end
  end

  test "loop method" do
    for key <- Map.keys(@data) do
      assert LargestPrimeFactor.Loop.solve(key) == @data[key]
    end
  end

  test "lazy method" do
    for key <- Map.keys(@data) do
      assert LargestPrimeFactor.Lazy.solve(key) == @data[key]
    end
  end
end
