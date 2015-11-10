defmodule ElixirExamples.BasicTypes do

  use ExUnit.Case, async: true

  test "atoms" do
    my_atom = :symbol
    assert :symbol == my_atom
  end

  test "nil" do
    assert nil == :nil
  end

  test "booleans" do
    assert :true == true
    assert false == :false

    assert not (true and false)
    assert false or true
    assert not false

    assert :not_true_or_false
    assert_raise ArgumentError, fn ->
      assert not :not_true_or_false
    end

    assert nil == :nil
    assert nil != :false
    assert (nil || false) == :false
    assert (nil || false || true) == :true

    assert (true && 9) == 9
    assert (false && 9) == :false
    assert (nil && 9) == :nil
  end

  test "integers" do
    my_integer = 100
    assert 100 == my_integer
    assert 1000 == 1_000
  end

  test "floats" do
    assert 2.718281828e0 == 2_718.281_828e-3
  end

  test "ranges" do
    my_range = 1..10
    assert 1..10 == my_range
  end

end
