defmodule ElixirExamples.StringTypesTest do

  use ExUnit.Case, async: true

  test "binary strings" do
    my_string = "This is a string"
    assert "This is a string" == my_string

    my_embedded_string = "Yes! #{my_string} too!"
    assert "Yes! This is a string too!" == my_embedded_string
    assert ~s(Yes! This is a string too!) == my_embedded_string
    assert ~s("Yes! \#{my_string} too!") == ~S("Yes! #{my_string} too!")

    my_multiline_string = "
This is
a multiline string
"
    assert "\nThis is\na multiline string\n" == my_multiline_string

    my_heredoc_string = """
Heredoc must end on its own line """
"""
    assert "Heredoc must end on its own line \"\"\"\n" == my_heredoc_string

    my_concatenated_string = "String" <> " " <> "con" <> "cat" <> "enation"
    assert "String concatenation" == my_concatenated_string
  end

  test "character lists" do
    my_character_list = 'ABCD'
    assert 'ABCD' == my_character_list
    assert [ 65, 66, 67, 68 ] == my_character_list

    my_interpolated_character_list = '#{my_character_list}EFG'
    assert 'ABCDEFG' == my_interpolated_character_list
    assert ~c(ABCDEFG) == my_interpolated_character_list
    assert ~c('\#{my_character_list}EFG') == ~C('#{my_character_list}EFG')

    my_multiline_character_list = '
This is
a multiline character list
'
    assert '\nThis is\na multiline character list\n' == my_multiline_character_list
 
    my_heredoc_character_list = '''
Heredoc must end on its own line '''
'''
    assert 'Heredoc must end on its own line \'\'\'\n' == my_heredoc_character_list

    assert "Not Same" != 'Not Same'
    assert 'Same' == String.to_char_list("Same")
    assert "Same" == List.to_string('Same')

  end

  test "i18n support" do
    my_i18n_string = "Iñtërnâtiônàlizætiøn"
    assert "Iñtërnâtiônàlizætiøn" == my_i18n_string 
  end

end
