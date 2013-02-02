module ApplicationHelper
  
  def get_all_themes
    StEnki::Application::ALL_THEMES
  end

  def get_theme(theme)
    get_all_themes[theme.to_sym]
  end

  def get_theme_stylesheet_link

    if current_user && current_user.bootswatch_theme
      begin
        stylesheet_link_tag current_user.bootswatch_theme, :media => "all"
      rescue
        flash[:alert] = "Could not find user's preferred theme. Defaulting to cyborg"
        stylesheet_link_tag "application_bootstrap_cyborg.css", :media => "all"
        
      end
    else
      stylesheet_link_tag "application_bootstrap_plain.css", :media => "all"
    end

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

  def my_menu_items

    Proc.new do |level_0|

      Rails.application.routes.routes.each do |route|
        route.nav_item(level_0)
      end

      # root.recursive_nav_items(level_0)
    end

    # root = Rails.application.routes.routes.select{|r| r.name == "root" }.first

    # if root
    #   Proc.new do |level_0|
    #     level_0.item :test_regex_nav_item, "regex test", "/widgets/1"[/\A\/(widgets)\/[^\/]+{1}$/]
    #     root.recursive_nav_items(level_0)
    #   end
    # else
    #   raise "Couldn't find a root route. Add a route like < root :to => 'some_controller#some_action' > to your routes.rb"
    # end

  end

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
