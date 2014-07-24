require 'active_record'
require 'active_support/inflector'

require 'roleable/version'
require 'roleable/acts_as_roleable'

module Roleable
  if defined? ActiveRecord::Base
    ActiveRecord::Base.extend Roleable::ActsAsRoleable
  end
end
