require 'spec_helper'

RSpec.describe ReversePolishCalculator do
  let (:calc) { ReversePolishCalculator.new }
  it 'can add 2 numbers' do
    calc.expression = '2 2 +'

    expect(do_calculation(calc)).to equal(4.0)
  end

  it 'can subtract 2 numbers' do
    calc.expression = '10 2 -'

    expect(do_calculation(calc)).to equal(8.0)
  end

  it 'can divide 2 floats' do
    calc.expression = '7.5 2.5 /'

    expect(do_calculation(calc)).to equal(3.0)
  end

  it 'can multiply 2 numbers' do
    calc.expression = '10 100 *'

    expect(do_calculation(calc)).to equal(1000.0)
  end

  it 'can add and add 3 numbers with two operators, one a float' do
    calc.expression = '2 2 8.5 + +'

    expect(do_calculation(calc)).to equal(12.5)
  end

  it 'can subtract and add 3 numbers' do
    calc.expression = '2.1 10 2 - +'

    expect(do_calculation(calc)).to equal(10.1)
  end

  it 'can subtract and divide 3 numbers' do
    calc.expression = '10 23 3 - /'

    expect(do_calculation(calc)).to equal(0.5)
  end

  it 'can multiply and multiply 3 numbers' do
    calc.expression = '10 10 10 * *'

    expect(do_calculation(calc)).to equal(1000.0)
  end

  it 'can multiply, add and subtract 4 numbers' do
    calc.expression = '20 10 2 2 * + -'

    expect(do_calculation(calc)).to equal(6.0)
  end

  it 'can handle negative results' do
    calc.expression = '20 20 10 10 * + -'

    expect(do_calculation(calc)).to equal(-100.0)
  end

  def do_calculation(calc)
    calc.evaluate_expression(calc.expression_array)
    calc.evaluation.join.to_f
  end
end
