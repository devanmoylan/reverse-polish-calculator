require 'spec_helper'

RSpec.describe ReversePolishCalculator do
  it 'has a version number' do
    expect(ReversePolishCalculator::VERSION).not_to be nil
  end

  it 'does something useful' do
    calc = ReversePolishCalculator.new
    allow(calc).to receive(:start)

    expect(ReversePolishCalculator).to receive(:new).and_return(calc)

    run_file('./bin/console')
  end
end
