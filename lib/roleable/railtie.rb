require 'roleable'
require 'rails'

module Roleable
  class Railtie < Rails::Railtie
    config.to_prepare do
      ActiveRecord::Base.extend Roleable::ActsAsRoleable
    end
  end
end
