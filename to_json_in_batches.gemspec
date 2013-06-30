# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_json_in_batches/version'

Gem::Specification.new do |gem|
  gem.name          = "to_json_in_batches"
  gem.version       = ToJsonInBatches::VERSION
  gem.authors       = ["Victor Zagorski"]
  gem.email         = ["victor@zagorski.ru"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'rails', '~> 3.2.0'
  # gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'activerecord-nulldb-adapter', '~> 0.2.3'
end
