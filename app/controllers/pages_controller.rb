class PagesController < HighVoltage::PagesController
  # authorize_resource
  skip_authorization_check
  skip_load_and_authorize_resource

  # before_filter :authenticate
  # layout :layout_for_page

  # def index
  #   @all_files = Dir['app/views/pages/files/**/*']
  #   # render :text => "index contr"
  #   # files = Array.new
  #   # @all_files = Rails.root.join('app', 'views', 'pages').children.select { |n| 
  #   # # @all_files = Rails.root.join('app', 'views', 'pages').children.select { |n| 
  #   #   File.file?(n) && n.basename.to_s[0] != '_'
  #   # }
  #   # puts "path: " + File.basename(Dir.getwd)
  # end

  # def display
    


  #   page = Rails.root + 'app/views/pages/' + params[:page].to_s

  #   puts page

  #   f = File.new(page)

  #   puts f.inspect

  #   # render :text => f.inspect
  #   render :inline => page.to_s

  # end

  # protected
  #   def layout_for_page
  #     case params[:id]
  #     when 'home'
  #       'home'
  #     else
  #       'application'
  #     end
  #   end
end