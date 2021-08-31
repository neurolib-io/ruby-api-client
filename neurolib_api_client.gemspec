# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neurolib_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'neurolib_api_client'
  spec.version       = NeurolibApiClient::VERSION
  spec.authors       = ['Neurolib']
  spec.email         = ['tech@neurolib.io']

  spec.summary       = 'Client for Neurolib recommendation API'
  spec.homepage      = 'http://www.neurolib.io'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 1.9.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'multi_json'
  spec.add_dependency 'httparty'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end