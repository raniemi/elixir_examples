defmodule ElixirExamples.FunctionTypesTest do

  use ExUnit.Case, async: true

  test "function variable, anonymous function, or lambda" do
    my_function = fn(x, y) -> "#{x}, #{y}!" end
    assert "Hello, World!" == my_function.("Hello", "World") 

    my_capture_operator = &("#{&1}, #{&2}!") 
    assert "Hello, World!" == my_capture_operator.("Hello", "World")
  end

  test "closure" do
    my_outer_variable = "Hello, World!"
    my_closure = fn() -> my_outer_variable end
    assert "Hello, World!" == my_closure.()
  end

end
