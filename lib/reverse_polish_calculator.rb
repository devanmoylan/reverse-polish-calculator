class ReversePolishCalculator
  ## Resources:
  # http://rubular.com/
  # https://en.wikipedia.org/wiki/Reverse_Polish_notation

  OPERATORS = ['+', '-', '*', '/'].freeze
  VALID_EXITS = %w[exit q quit].freeze
  EXAMPLES = ['6 2 +', '4 5 +', '4 5 + 3 *', '91 1 +', '8 2 *', '5 5 -', '6 12 -', '2 20 10 - /'].freeze

  attr_accessor :expression, :evaluation

  def initialize
    @expression = nil
    @evaluation = []
  end

  def operation
    ## TODO: puts the list of commands a user can use.
    welcome_user
    evaluate until input_contains_valid_exit
  end

  def evaluate
    gather_input
    input_contains_valid_exit ? exit : evaluate_input

    # introduce rules: maybe reference a resource
    # TODO look up polish cal rules
    # TODO break everything into separate methods
    # TODO clean up unused parts / install rubocop
    # TODO work in exit (q), and clear
    # TODO write tests
    # TODO write a read me
    # TODO create examples
  end

  def evaluate_input
    case @expression
    when 'clear'
      clear_evaluation
    when 'example'
      output_example
    else
      evaluate_expression(expression_array)
    end
  end

  def clear_evaluation
    @evaluation.clear
    puts 'You now have a clean slate.'
  end

  def output_example
    @expression = EXAMPLES.sample
    puts "example input > #{@expression}"
    evaluate_expression(expression_array)
    clear_evaluation
  end

  def input_contains_valid_exit
    VALID_EXITS.include? @expression
  end

  def print_result
    puts "result: #{@evaluation.join.to_i}"
  end

  def gather_input
    print 'input expression > '
    @expression = gets.strip.downcase
  end

  def expression_array
    @expression.split(' ')
  end

  def evaluate_expression(array)
    array.each do |element|
      if element =~ /^[0-9]*$/
        # push in floats
        @evaluation.push(element.to_f)
      elsif OPERATORS.include? element
        # check for appropriate number of intergers
        raise 'You must have two operands before an operator. Please try again.' if @evaluation.length < 2
        operands = @evaluation.pop(2)
        @evaluation.push(operands[0].send(element, operands[1]))
      else
        # handle inputs that are exceptions by raising an error
        raise "The input of \"#{element}\" is neither a valid integer nor operator. Please input a number 0-9 or one of the following operators: #{OPERATORS} "
      end
    end
    print_result
  end

  def welcome_user
    puts ''
  end
end
