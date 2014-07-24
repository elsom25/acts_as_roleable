# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roleable/version'

Gem::Specification.new do |spec|
  spec.name                  = 'roleable'
  spec.version               = Roleable::VERSION
  spec.authors               = ['Jesse McGinnis']
  spec.email                 = ['jesse@jcmcginnis.com']
  spec.summary               = %q{Adds role based authorization to Rails with RoleModel.}
  spec.description           = %q{Wraps RoleModel up to make role based authorization really easy in Rails >= 3.2.}
  spec.homepage              = 'https://github.com/elsom25/roleable'
  spec.license               = 'MIT'

  spec.files                 = `git ls-files -z`.split("\x0")
  spec.executables           = spec.files.grep(%r{^bin/}){ |f| File.basename(f) }
  spec.test_files            = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 1.9.3'

  # development dependencies
  spec.add_development_dependency 'bundler',             '~> 1.6'
  spec.add_development_dependency 'rake',                '~> 10'
  spec.add_development_dependency 'rails',               '~> 3.2'

  spec.add_development_dependency 'minitest',            '~> 5'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'coveralls'

  # gem dependencies
  spec.add_runtime_dependency     'role_model'
end
