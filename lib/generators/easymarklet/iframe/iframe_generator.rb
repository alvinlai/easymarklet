module Easymarklet
  class IframeGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def copy_files
      template "iframe_bookmarklet.js", "app/assets/javascripts/#{file_name}_bookmarklet.js"
      template "iframe_consumer.js", "app/assets/javascripts/#{file_name}_consumer.js"
      template "iframe_producer.js", "app/assets/javascripts/#{file_name}_producer.js"
      template "iframe_producer_controller.rb", "app/controllers/#{file_name}_producer_controller.rb"
      template "iframe_producer_index.html.erb", "app/views/#{file_name}_producer/index.html.erb"
      template "views/easymarklet_layout.html.erb", "app/views/layouts/#{file_name}_producer.html.erb"
    end

    def create_routes
      route("match '#{file_name}_producer' => '#{file_name}_producer#index'")
    end

    def display_msg
      puts ""
      puts "You can link to your new bookmarklet with this :"
      puts ""
      puts "<%= link_to '#{file_name.titleize}', easymarklet_js('#{file_name}_consumer.js') %>"
      puts ""
    end

  end
end
