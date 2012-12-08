class PagesController < HighVoltage::PagesController
  # before_filter :authenticate
  # layout :layout_for_page

  def index
    # render :text => "index contr"
    # files = Array.new
    Rails.root.join('app', 'views', 'pages').children.each { |n| puts n if File.file?(n) }
    puts "path: " + File.basename(Dir.getwd)
  end

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