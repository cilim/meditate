module Meditate
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def add_javascripts
        append_file 'app/assets/javascripts/application.js', "//= require meditate\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/application.scss', "*= require meditate\n", before: /\*\//, verbose: true
      end

      def setup_routes
        route "resources :inline_validations, only: [:create]"
      end

=begin
      def create_controller_file
        create_file "app/controllers/inline_validations_controller.rb", "This is a placeholder"
      end
=end

      def copy_controller
        copy_file "inline_validations_controller.rb", "app/controllers/inline_validations_controller.rb"
      end
    end
  end
end
