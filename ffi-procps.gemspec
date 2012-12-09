# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffi-procps/version'

Gem::Specification.new do |gem|
  gem.name          = "ffi-procps"
  gem.version       = Ffi::Procps::VERSION
  gem.authors       = ["Andreas Loupasakis"]
  gem.email         = ["andreas@aloop.org"]
  gem.description   = %q{FFI wrapper for procps library}
  gem.summary       = %q{FFI wrapper for procps library}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "ffi"#, [">= 1.0.9"]
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
end
