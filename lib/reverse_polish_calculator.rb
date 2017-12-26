require_relative 'guide.rb'

# Postfix notation
class ReversePolishCalculator
  VERSION = '0.1.0'.freeze

  ## Resources:
  # http://rubular.com/
  # https://en.wikipedia.org/wiki/Reverse_Polish_notation
  # http://www.betterspecs.org/
  # https://ruby-doc.org/core-2.4.2/Object.html

  OPERATORS = ['+', '-', '*', '/'].freeze
  VALID_EXITS = %w[exit q quit].freeze
  EXAMPLES = ['6 2 +',
              '4 5 +',
              '4 5 + 3 *',
              '91 1 +',
              '8 2 *',
              '5 5 -',
              '6 12 -',
              '2 20 10 - /'].freeze

  attr_accessor :expression, :evaluation

  def initialize(expression = nil, evaluation = [])
    @expression = expression
    @evaluation = evaluation
  end

  include Guide

  def run
    print_introduction
    evaluate until input_contains_valid_exit
  end

  def evaluate
    gather_input
    input_contains_valid_exit ? exit : evaluate_input
  end

  def gather_input
    print 'input expression > '
    @expression = gets.strip.downcase
  end

  def input_contains_valid_exit
    VALID_EXITS.include? @expression
  end

  def evaluate_input
    case @expression
    when 'help'
      print_operation_guide
    when 'clear'
      clear_evaluation
    when 'example'
      run_example
    else
      evaluate_expression(expression_array)
    end
  end

  def clear_evaluation
    @evaluation.clear
  end

  def evaluate_expression(array)
    array.each do |element|
      if element =~ /^[0-9].*$/
        @evaluation.push(element.to_f)
      elsif OPERATORS.include? element
        raise 'You must have two operands before and per operator.' if @evaluation.length < 2
        operands = @evaluation.pop(2)
        @evaluation.push(operands[0].send(element, operands[1]))
      else
        print_error(element)
      end
    end
    print_result
  end

  def print_result
    puts "result: #{@evaluation.last}"
  end

  def expression_array
    @expression.split(' ')
  end
end
