# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'im-chat-parser/version'

Gem::Specification.new do |spec|
  spec.name          = "im-chat-parser"
  spec.version       = ImChatParser::VERSION
  spec.authors       = ["arlyxiao"]
  spec.email         = ["kingla_pei@163.com"]
  spec.summary       = %q{Parse QQ/Webchat chat logs.}
  spec.description   = %q{Parse QQ/Webchat chat logs.}
  spec.homepage      = "https://github.com/arlyxiao/im-chat-parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.6"
end
