
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reverse_polish_calculator'

Gem::Specification.new do |spec|
  spec.name          = 'reverse_polish_calculator'
  spec.version       = ReversePolishCalculator::VERSION
  spec.authors       = ['Devan']
  spec.email         = ['dmmoylan@gmail.com']

  spec.summary       = 'Reverse Polish calculator'
  spec.homepage      = 'https://github.com/devanmoylan/reverse-polish-calculator/'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
