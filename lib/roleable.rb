require 'active_support/core_ext'

require 'roleable/version'
require 'roleable/railtie'

module Roleable
  autoload :ActsAsRoleable, 'roleable/acts_as_roleable'
end
