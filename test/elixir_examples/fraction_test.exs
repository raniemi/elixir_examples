defmodule ElixirExamples.FractionTest do

  use ExUnit.Case, async: true
  alias ElixirExamples.Fraction, as: Fraction
  doctest Fraction #ElixirExamples.Fraction

  setup do
    half = Fraction.new!(1, 2)
    quarter = Fraction.new!(1, 4)
    half_tuple = { 1, 2 }
    quarter_tuple = { 1, 4 }
    { :ok, 
      half: half, quarter: quarter, 
      half_tuple: half_tuple, quarter_tuple: quarter_tuple 
    }
  end

  test "should have a numerator and denominator" do
    my_fraction = Fraction.new!(1, 2)
    assert 1 == my_fraction.numerator
    assert 2 == my_fraction.denominator
    assert "1/2" == inspect(my_fraction)
  end

  test "should be returned as a float" do
    my_fraction = Fraction.new!(1, 2)
    assert 0.5 == Fraction.to_float(my_fraction)
    assert 0.5 == my_fraction |> Fraction.to_float
    assert 0.5 == Fraction.to_float(1, 2)
  end

  test "should add two fractions", context do
    %{ half: half, quarter: quarter, 
       half_tuple: half_tuple, quarter_tuple: quarter_tuple } = context
    assert Fraction.add(half, half) |> Fraction.to_float == 1.0
    assert Fraction.add!(half_tuple, half_tuple) |> Fraction.to_float == 1.0
    assert Fraction.add(half, quarter) |> Fraction.to_float == 0.75
    assert Fraction.add!(half_tuple, quarter_tuple) |> Fraction.to_float == 0.75
  end

  test "should subtract two fractions", context do
    %{ half: half, quarter: quarter, 
       half_tuple: half_tuple, quarter_tuple: quarter_tuple } = context
    assert half |> Fraction.subtract(half) |> Fraction.to_float == 0.0
    assert half_tuple |> Fraction.subtract!(half_tuple) |> Fraction.to_float == 0.0
    assert half |> Fraction.subtract(quarter) |> Fraction.to_float == 0.25
    assert half_tuple |> Fraction.subtract!(quarter_tuple) |> Fraction.to_float == 0.25
  end

  test "should multiply two fractions", context do
    %{ half: half, quarter: quarter, 
       half_tuple: half_tuple, quarter_tuple: quarter_tuple } = context
    multiply = fn(f1, f2) -> f1 |> Fraction.multiply(f2) |> Fraction.to_float end
    multiply! = fn(f1, f2) -> f1 |> Fraction.multiply!(f2) |> Fraction.to_float end
    assert multiply.(half, half) == 0.25
    assert multiply!.(half_tuple, half_tuple) == 0.25
    assert multiply.(half, quarter) == 0.125
    assert multiply!.(half_tuple, quarter_tuple) == 0.125
  end

  test "should divide two fractions", context do
    %{ half: half, quarter: quarter, 
       half_tuple: half_tuple, quarter_tuple: quarter_tuple } = context
    divide = &(&1 |> Fraction.divide!(&2) |> Fraction.to_float)
    assert divide.(half, half) == 1.0
    assert divide.(half_tuple, half_tuple) == 1.0
    assert divide.(half, quarter) == 2.0
    assert divide.(half_tuple, quarter_tuple) == 2.0
  end

  test "should never create an undefined", context do
    assert_raise RuntimeError, "The denominator cannot be 0!", fn ->
      Fraction.new!(1, 0)
    end
  end

end
