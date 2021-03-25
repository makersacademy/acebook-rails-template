# -*- encoding: utf-8 -*-
# stub: orderly 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "orderly".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Gesimondo".freeze]
  s.date = "2020-02-20"
  s.description = "orderly: an rspec assertion for request specs to assert that one piece of content appears on the page before another.".freeze
  s.email = ["john@jmondo.com".freeze]
  s.homepage = "https://github.com/jmondo/orderly".freeze
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Assert this is before that".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rspec>.freeze, [">= 2.14"])
    s.add_runtime_dependency(%q<capybara>.freeze, [">= 1.1"])
    s.add_development_dependency(%q<mocha>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_development_dependency(%q<appraisal>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<selenium-webdriver>.freeze, [">= 0"])
    s.add_development_dependency(%q<webdrivers>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rspec>.freeze, [">= 2.14"])
    s.add_dependency(%q<capybara>.freeze, [">= 1.1"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.1"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 1.0"])
    s.add_dependency(%q<selenium-webdriver>.freeze, [">= 0"])
    s.add_dependency(%q<webdrivers>.freeze, [">= 0"])
  end
end
