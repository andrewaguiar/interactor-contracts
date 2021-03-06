# coding: utf-8

require File.expand_path("../lib/interactor/contracts/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name    = "interactor-contracts"
  spec.version = Interactor::Contracts::VERSION
  spec.authors = ["Michael Herold"]
  spec.email   = ["michael.j.herold@gmail.com"]

  spec.summary     = "Add contacts to your interactors"
  spec.description = "Add contacts to your interactors"
  spec.homepage    = "https://github.com/michaelherold/interactor-contracts"
  spec.license     = "MIT"

  spec.files = %w(CHANGELOG.md LICENSE.md README.me Rakefile)
  spec.files += %w(interactor-contracts.gemspec)
  spec.files += Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-validation", "~> 0.7", "< 0.8"
  spec.add_dependency "interactor", "~> 3"

  spec.add_development_dependency "bundler", "~> 1.11"
end
