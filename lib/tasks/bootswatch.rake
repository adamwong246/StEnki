namespace :bootswatch do
  desc "Create bootswatch themes"

  task :generate => :environment do
    require 'erb'
    require 'ostruct'

    class ErbalT < OpenStruct
      def render(template)
        ERB.new(template).result(binding)
      end
    end


    StEnki::Application::ALL_THEMES.each do |key_name, value_file|

      et = ErbalT.new({ :theme_name => key_name})
      string = File.open(Rails.root + "lib/tasks/css_src/_application.css.scss.erb").read
      # renderer = ERB.new(string)
      rendered =  et.render(string)
      out_file = Rails.root + "app/assets/stylesheets/#{value_file}.scss"
      puts "writing to : #{out_file}"

      File.open(out_file, 'w') {|f| f.write(rendered) }
    end

    # puts renderer.result('theme_name', 'absolom')
  end
end
