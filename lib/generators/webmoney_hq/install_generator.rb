require 'rails/generators/base'
module WebmoneyHq
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)


      desc "Copies migrations to your application."
      def copy_migrations
        rake("webmoney_hq:install:migrations")
      end

      def copy_initializer
        template "hq_init.rb", "config/initializers/webmoney_hq.rb"
        template "hq.erb", "app/models/#{@name.downcase}.rb"
      end
      def add_route
        route "mount WebmoneyHq::Engine, at: \"/#{@name.downcase}\""
      end
    end
  end
end
