defmodule NumberSpiralDiagonalsTest do
  use ExUnit.Case
  doctest NumberSpiralDiagonals

  @data %{5 => 101, 1001 => 669_171_001, 1 => 1, 2 => 0, -10 => 0}

  test "recursion method" do
    for key <- Map.keys(@data) do
      assert NumberSpiralDiagonals.Recursion.solve(key) == @data[key]
    end
  end

  test "tail recursion method" do
    for key <- Map.keys(@data) do
      assert NumberSpiralDiagonals.TailRecursion.solve(key) == @data[key]
    end
  end

  test "module method" do
    for key <- Map.keys(@data) do
      assert NumberSpiralDiagonals.Module.solve(key) == @data[key]
    end
  end

  test "map method" do
    for key <- Map.keys(@data) do
      assert NumberSpiralDiagonals.Map.solve(key) == @data[key]
    end
  end

  test "loop method" do
    for key <- Map.keys(@data) do
      assert NumberSpiralDiagonals.Loop.solve(key) == @data[key]
    end
  end

  test "lazy method" do
    for key <- Map.keys(@data) do
      assert NumberSpiralDiagonals.Lazy.solve(key) == @data[key]
    end
  end
end
