require 'acts_as_roleable'
require 'rails'

module ActsAsRoleable
  class Railtie < Rails::Railtie
    config.to_prepare do
      ActiveRecord::Base.extend ActsAsRoleable::Implementation
    end
  end
end
