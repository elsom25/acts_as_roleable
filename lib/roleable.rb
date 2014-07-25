require 'role_model'

require 'roleable/version'
require 'roleable/acts_as_roleable'

require 'roleable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
