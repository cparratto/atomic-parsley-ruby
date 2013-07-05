# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'atomic-parsley-ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "atomic-parsley-ruby"
  spec.version       = AtomicParsleyRuby::VERSION
  spec.authors       = ["cparratto"]
  spec.email         = ["cparratto@pnmac.com"]
  spec.description   = %q{A wrapper api for the atomic-parsley cli}
  spec.summary       = %q{I tak not major credit for this its simpley just a rapper for the c application available at http://atomicparsley.sourceforge.net/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mocha"
end
