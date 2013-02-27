module RailsAdmin
  module Config
    module Actions
      class AllRoutes < RailsAdmin::Config::Actions::Base

        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          "Routes"
        end

        register_instance_option :controller do
          Proc.new do
            # @history = @auditing_adapter && @auditing_adapter.latest || []
            # if @action.statistics?
            #   @abstract_models = RailsAdmin::Config.visible_models(:controller => self).map(&:abstract_model)

            #   @most_recent_changes = {}
            #   @count = {}
            #   @max = 0
            #   @abstract_models.each do |t|
            #     scope = @authorization_adapter && @authorization_adapter.query(:index, t)
            #     current_count = t.count({}, scope)
            #     @max = current_count > @max ? current_count : @max
            #     @count[t.pretty_name] = current_count
            #     if t.properties.find{|c| c[:name] == :updated_at }
            #       @most_recent_changes[t.pretty_name] = t.first(:sort => "#{t.table_name}.updated_at").try(:updated_at)
            #     end
            #   end
            # end
            # render action: :documentation
            # render text: "herp da derp"
                # require 'rails/application/route_inspector'
                # require 'rails/routes'
            Rails.application.reload_routes!
            routes = Rails.application.routes.routes
            require 'rails/application/route_inspector'
            inspector = Rails::Application::RouteInspector.new
            @routes = inspector.collect_routes(routes)

            @routes.map { |x| 
              x[:form] =  "derp"
            }

             # = Sextant.format_routes
            # render action: "sextant/index"
            # render :template => main_app.RoutesController/index
            # render :template => 'posts/show'
          end
        end

        register_instance_option :route_fragment do
          'Routes'
        end

        register_instance_option :link_icon do
          'icon-sitemap'
        end

        register_instance_option :statistics? do
          false
        end
      end
    end
  end
end