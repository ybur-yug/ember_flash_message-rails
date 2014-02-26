# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ember_flash_message_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "ember_flash_message_rails"
  spec.version       = EmberFlashMessageRails::VERSION
  spec.authors       = ["Bobby Grayson", "Ryan T"]
  spec.email         = ["bobbygrayson@gmail.com"]
  spec.summary       = %q{A plug and play gem for ember flash messages on route transition}
  spec.description   = %q{A simple means to have customized messages for after an action completion in an ember+rails app. The messages are tied to a completion of some action x, or also can be configured to be force-displayed and then use an ember.run.later to get rid of them after a set period of time. }
  spec.homepage      = "http://www.github.com/rhgraysonii/ember-flash-message"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  gem.add_development_dependency "coffee-rails"
  gem.add_development_dependency "ember-rails"
  gem.add_development_dependency "rails"
  gem.add_dependency "railties", "~> 3.1"

end
