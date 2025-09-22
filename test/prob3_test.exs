defmodule Lab1Test do
  use ExUnit.Case
  doctest Lab1

  test "recursion method test" do
    assert Lab1.LargestPrimeFactor.recursion(600_851_475_143) == 6857
  end

  test "is prime function" do
    assert Lab1.LargestPrimeFactor.is_prime?(6857)
    assert not Lab1.LargestPrimeFactor.is_prime?(9997)
  end

  test "module method test" do
    assert Lab1.LargestPrimeFactor.module(600_851_475_143) == 6857
  end
end
