require 'rails/railtie'

module ActiveRecord
  module SessionStore
    class Railtie < Rails::Railtie
      rake_tasks { load File.expand_path("../../../tasks/database.rake", __FILE__) }
      config.after_initialize do
        # Hook to set up sessid compatibility.
        Session.send(:setup_sessid_compatibility!) unless
          ARGV.include?('db:create') || ARGV.include?('db:migrate')
      end
    end
  end
end
