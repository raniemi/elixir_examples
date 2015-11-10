defmodule ElixirExamples.Fraction.InspectTest do
  use ExUnit.Case, async: true
  alias ElixirExamples.Fraction

  test "should inspect a fraction" do
    half = Fraction.new!(1, 2)
    assert Inspect.ElixirExamples.Fraction.inspect(half, %{}) == "1/2"
  end

end
