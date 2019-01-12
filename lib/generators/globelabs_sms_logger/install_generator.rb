require 'rails/generators'

# Module
module GlobelabsSmsLogger
  # Generators
  module Generators
    # Class
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)
      desc 'Creates globelabs_sms_logger.rb initializer for your application'

      def copy_initializer
        template 'dash_initializer.rb',
                 'config/initializers/globelabs_sms_logger.rb'
        puts 'Done! Configure the file in
          config/initializers/globelabs_sms_logger.rb'
      end
    end
  end
end
