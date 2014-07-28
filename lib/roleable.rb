require 'role_model'

require 'acts_as_roleable/version'
require 'acts_as_roleable/implementation'

require 'acts_as_roleable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
