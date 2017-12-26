module Guide
  def print_introduction
    puts ''
    puts '================================================================================='
    puts '>>>>>>>>>>>>>>>>>>>>>>>>> Reverse Polish notation (RPN)<<<<<<<<<<<<<<<<<<<<<<<<<<'
    puts '================================================================================='
    puts ''
    puts 'The mathematical notation in which every operator follows all of its operands, in'
    puts 'contrast to Polish notation (PN), which puts the operator before its operands. '
    puts 'It is also known as postfix notation. It does not need any parentheses as long as'
    puts 'each operator has a fixed number of operands.'
    puts ''
    puts '- From Wikipedia, the free encyclopedia'
    puts '(https://en.wikipedia.org/wiki/Reverse_Polish_notation)'
    puts ''
    puts "Type 'help' for a list of valid commands."
    puts ''
  end

  def print_error(invalid_input)
    puts ''
    puts 'Error:'
    puts "         > The input of \"#{invalid_input}\" is neither a valid"
    puts '         > fixnum, operator nor command. Valid inputs include: '
    puts '         > whole numbers (e.g. 0-9), floats (e.g. 0.50) '
    puts "         > or operators: #{ReversePolishCalculator::OPERATORS} "
    puts ''
  end

  def print_operation_guide
    puts ''
    puts '================================================================================='
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Valid Inputs <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    puts '================================================================================='
    puts ''
    puts 'To exit program:'
    ReversePolishCalculator::VALID_EXITS.each { |exit| puts "  > #{exit}" }
    puts 'Valid integer examples:'
    puts '  > 0'
    puts '  > 0.25'
    puts '  > 0.5'
    (1..9).each { |i| puts "  > #{i}" }
    puts '  > 9.99'
    puts 'Valid operators:'
    ReversePolishCalculator::OPERATORS.each { |operator| puts "  > #{operator}" }
    puts 'Reset evaluation:'
    puts '  > clear'
    puts 'Request example:'
    puts '  > example'
    puts ''
    clear_evaluation
  end

  def run_example
    clear_evaluation
    @expression = ReversePolishCalculator::EXAMPLES.sample
    puts "example input > #{@expression}"
    evaluate_expression(expression_array)
    clear_evaluation
  end
end
