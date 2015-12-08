defmodule ElixirExamples.ComplexTypesTest do

  use ExUnit.Case, async: true

  test "tuples" do
    my_tuple = { :ok, "string", 999, 3.14159 }
    assert { :ok, "string", 999, 3.14159 } == my_tuple

    assert "string" == elem(my_tuple, 1)
    assert Kernel.elem(my_tuple, 1) == elem(my_tuple, 1)

    assert_raise ArgumentError, fn ->
      elem(my_tuple, -1)
    end

    assert { 1, 2, 99 } == put_elem({ 1, 2, 3 }, 2, 99)
    assert { 1, 2, 99 } == Kernel.put_elem({ 1, 2, 3 }, 2, 99)
    
    assert_raise ArgumentError, fn ->
      put_elem({}, 0, 1)
    end
  end

  test "list" do
    my_list = [ 1, 2, 3 ]
    assert [ 1, 2, 3 ] == my_list 
    
    assert 3 == length(my_list)
    assert 3 == Kernel.length(my_list)

    assert 2 == Enum.at(my_list, 1)  # O(n)

    assert 1 in my_list
    assert not 4 in my_list
    assert !4 in my_list

    assert [ 11, 2, 3 ] == List.replace_at(my_list, 0, 11)    # O(n)
    assert [ 1, 2, 11, 3 ] == List.insert_at(my_list, 2, 11)  # O(n)
    assert [ 1, 2, 3, 11 ] == List.insert_at(my_list, -1, 11) # O(n)

    assert [ 1, 2, 3, 4 ] == my_list ++ [ 4 ] # O(n)

    assert [ :head, :tail ] == [ :head | [ :tail | [] ] ] 
    assert [ :head, :body, :tail ] == [ :head | [ :body | [ :tail | [] ] ] ] 

    assert :head ==  hd([ :head | [ :tail | [] ] ]) # O(1)
    assert [ :body, :tail ] == tl([ :head | [ :body | [ :tail | [] ] ] ]) # O(1)

    assert [ :head, :tail ] == [ :head | [ :tail ] ] # O(1) - push onto a stack
  end

  test "map" do
    my_map = %{ :first => "John", :last => "Doe" }
    assert %{ first: "John", last: "Doe" } == my_map

    assert "John" == my_map[:first]
    assert "John" == my_map.first
  
    assert nil == my_map[:bogus]
    assert_raise KeyError, fn ->
      my_map.bogus
    end
  
    assert %{ first: "John", last: "Roe" } == %{ my_map | last: "Roe" }

    assert %{ first: "John", last: "Doe", age: 50 } == Map.put(my_map, :age, 50)

    # NOTE: this originally worked fine when Elixir was installed locally via brew (version difference?)
    #assert_raise ArgumentError, fn ->
    assert_raise KeyError, fn ->
      %{ my_map | age: 50 }
    end

  end

end
