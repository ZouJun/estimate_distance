# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'estimate_distance'

Gem::Specification.new do |s|
  s.name          = "estimate_distance"
  s.version       = '0.0.1'
  s.authors       = ["ZouJun"]
  s.email         = ["953986113@qq.com"]
  s.summary       = "estimate distance"
  s.description   = "estimate distance"
  s.homepage      = 'https://github.com/ZouJun/estimate_distance'
  s.license       = "MIT"

  s.files         = ["lib/estimate_distance.rb"]
  s.require_paths = ["lib"]

  s.add_dependency "bundler", "~> 1.7"
  s.add_dependency "rake", "~> 10.0"
  s.add_dependency "rest-client", "~> 1.8"
end
