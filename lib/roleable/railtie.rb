require 'rails'
require 'roleable'

module ActsAsAwesome
  class Railtie < Rails::Railtie
    config.to_prepare do
      ActiveRecord::Base.extend Roleable::ActsAsRoleable
    end
  end
end
