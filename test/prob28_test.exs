defmodule NumberSpiralDiagonalsTest do
  use ExUnit.Case
  doctest NumberSpiralDiagonals

  test "recursion method" do
    assert NumberSpiralDiagonals.Recursion.solve(1001) == 669171001
  end

  test "tail recursion method" do
    assert NumberSpiralDiagonals.TailRecursion.solve(1001) == 669171001
  end

  test "module method" do
    assert NumberSpiralDiagonals.Module.solve(1001) == 669171001
  end

  test "map method" do
    assert NumberSpiralDiagonals.Map.solve(1001) == 669171001
  end

  test "loop method" do
    assert NumberSpiralDiagonals.Loop.solve(1001) == 669171001
  end

  test "lazy method" do
    assert NumberSpiralDiagonals.Lazy.solve(1001) == 669171001
  end
end
