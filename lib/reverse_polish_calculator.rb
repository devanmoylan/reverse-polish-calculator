class ReversePolishCalculator
  
  def new
    puts "new method"
    input = gets.strip.downcase
  end

  def calculate
    puts "Welcome to the ReversePolishCalculator! Reverse Polish notation (RPN) is a mathematical notation in which every operator
follows all of its operands, in contrast to Polish notation (PN), which puts the operator
before its operands. It is also known as postfix notation. It does not need any
parentheses as long as each operator has a fixed number of operands. 4. The program should exit when either `q` or the end-of-input indicator Ctrl+D is entered"
    input = gets.strip.downcase
  end

end
