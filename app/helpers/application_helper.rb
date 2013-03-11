module ApplicationHelper
  
  DEFAULT_THEME = "application_bootstrap_terminal.css"
  
  def get_all_themes
    StEnki::Application::ALL_THEMES
  end

  def get_theme(theme)
    get_all_themes[theme.to_sym]
  end

  def get_theme_stylesheet_link

    stylesheet_link_tag "application", :media => "all"

    # if current_user && current_user.bootswatch_theme
    #   begin
    #     stylesheet_link_tag current_user.bootswatch_theme, :media => "all"
    #   rescue
    #     flash[:alert] = "Could not find user's preferred theme. Defaulting to #{DEFAULT_THEME}"
    #     stylesheet_link_tag DEFAULT_THEME, :media => "all"
        
    #   end
    # else
    #   stylesheet_link_tag DEFAULT_THEME, :media => "all"
    # end



  end

  # translates flash message types to bootstrap css
  def twitterized_type(type)
    case type
      when :alert
        "alert-block"
      when :error
        "alert-error"
      when :notice
        "alert-info"
      when :success
        "alert-success"
      else
        type.to_s
    end
  end

  def current_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  # Turn a collection into html
  def ultrahumanize(collection)
  xhtml = Builder::XmlMarkup.new :target => out=(''), :indent => 2

    begin
      if !collection.kind_of?(Array)
        collection = [collection]
      end

      xhtml.div(:class => "ultrahumanized"){
        xhtml.strong("#{collection.first.class.name}")
        
        xhtml.table(:class => "table table-bordered table-stripe") {
          xhtml.tr{
            collection.first.attributes.keys.each do |attribute|
              xhtml.td(attribute)
            end

            xhtml.td("Show link")

          }

          collection.each do |single_thing|          
            xhtml.tr{
              single_thing.attributes.keys.each do |attribute|
                xhtml.td{
                  xhtml.target! << (best_in_place single_thing, attribute.to_sym).to_s
                }
              end

              xhtml.td{
                xhtml.a( { :href => url_for(:id => single_thing.id), :method => 'delete' }, 'Destroy' )
              }

            }
          end
        }  
      }
    rescue StandardError => bang
      return xhtml.strong(bang)
    end
  end


end
