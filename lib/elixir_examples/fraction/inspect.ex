defimpl Inspect, for: ElixirExamples.Fraction do
  import Inspect.Algebra

  @doc false
  def inspect(fraction, opts) do
    "#{fraction.numerator}/#{fraction.denominator}"
  end
end
