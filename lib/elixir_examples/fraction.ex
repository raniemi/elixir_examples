defmodule ElixirExamples.Fraction do
  @moduledoc """
  This module handles the creation of and the operations upon fractions.
  """
  defstruct numerator: nil, denominator: nil
  alias ElixirExamples.Fraction

  @doc """
  Creates a new fraction for a given numerator and denominator.
  """
  @spec new!(integer,integer) :: %Fraction{}
  def new!(numerator, denominator) do
    if ( denominator == 0 ) do
      raise("The denominator cannot be 0!")
    end
    # Struct instance => %Module{key: value}
    %Fraction{ numerator: numerator, denominator: denominator }
  end

  @doc """
  Returns the floating point representation for a given fraction.
  """
  @spec to_float(%Fraction{numerator: integer, denominator: integer}) :: float
  def to_float(%Fraction{numerator: n, denominator: d}) do
    n / d
  end

  @doc """
  Returns the floating point representation for a given numerator and denominator.
  """
  @spec to_float(integer, integer) :: float
  def to_float(numerator, denominator), do: to_float(new!(numerator, denominator))

  @doc """
  Adds two fractions together. Fractions are not required to have common denominators.
  """
  @spec add(%Fraction{}, %Fraction{}) :: %Fraction{}
  def add(%Fraction{numerator: n1, denominator: d1}, %Fraction{numerator: n2, denominator: d2}) do
    add!({n1, d1}, {n2, d2})
  end

  @doc """
  Adds two numerator and denominator tuples. Fractions are not required to have common denominators.
  """
  @spec add!(tuple, tuple) :: %Fraction{}
  def add!({ n1, d1 }, { n2, d2 }), do: new!(n1 * d2 + n2 * d1, d2 * d1)

  @doc """
  Subtracts one fraction from another. Fractions are not required to have common denominators. 
  """
  @spec subtract(%Fraction{}, %Fraction{}) :: %Fraction{}
  def subtract(%Fraction{numerator: n1, denominator: d1}, %Fraction{numerator: n2, denominator: d2}) do
    subtract!({n1, d1}, {n2, d2})
  end

  @doc """
  Subtracts one fraction tuple representation from another. Fractions are not required to have common denominators. 
  """
  @spec subtract!(tuple, tuple) :: %Fraction{}
  def subtract!({ n1, d1 }, { n2, d2 }), do: new!(n1 * d2 - n2 * d1, d2 * d1)

  @doc """
  Multiplies two fractions together.
  """
  @spec multiply(%Fraction{}, %Fraction{}) :: %Fraction{}
  def multiply(%Fraction{numerator: n1, denominator: d1}, %Fraction{numerator: n2, denominator: d2}) do
    multiply!({ n1, d1 }, { n2, d2 })
  end

  @doc """
  Multiplies two tuples representing fractions together.
  """
  @spec multiply!(tuple, tuple) :: %Fraction{}
  def multiply!({ n1, d1 }, { n2, d2 }), do: new!(n1 * n2, d1 * d2)

  @doc """
  Divides one fraction from another. Multiplies the first fraction with the reciprocal of the second.
  """
  @spec divide!(%Fraction{}, %Fraction{}) :: %Fraction{}
  def divide!(%Fraction{numerator: n1, denominator: d1}, %Fraction{numerator: n2, denominator: d2}) do
    divide!({ n1, d1 }, { n2, d2 })
  end

  @doc """
  Divides one fraction tuple representation from another. Multiplies the first fraction with the reciprocal of the second.
  """
  @spec divide!(tuple, tuple) :: %Fraction{}
  def divide!({ n1, d1 }, { n2, d2 }), do: new!(n1 * d2, n2 * d1)

end
