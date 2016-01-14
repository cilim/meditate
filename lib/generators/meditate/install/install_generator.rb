module Meditate
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file 'app/assets/javascripts/application.js', "//= require meditate\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/application.scss', "*= require meditate\n", before: /\*\//, verbose: true
      end

      def setup_routes
        route "resources :inline_validations, only: [:create]"
      end

      def copy_controller
        copy_file "inline_validations_controller.rb", "app/controllers/#{file_name}.rb"
      end
    end
  end
end
