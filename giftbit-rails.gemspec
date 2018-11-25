
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "giftbit-rails/version"

Gem::Specification.new do |spec|
  spec.name          = "giftbit-rails"
  spec.version       = Giftbit::VERSION
  spec.authors       = ["Fakhir Shad", "Muaaz Rafi"]
  spec.email         = ["fakhir.shad@hotmail.com", "muaazrafi@gmail.com"]
  spec.platform      = Gem::Platform::RUBY

  spec.summary       = %q{Giftbit API wrapper}
  spec.description   = %q{A simple Ruby wrapper for Giftbit API}
  spec.homepage      = "https://github.com/fakhir-shad/giftbit"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "httparty", "~> 0.13.7"
end
