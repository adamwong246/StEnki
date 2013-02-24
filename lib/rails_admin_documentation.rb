module RailsAdmin
  module Config
    module Actions
      class Documentation < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          false
        end

        register_instance_option :breadcrumb_parent do
          nil
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
            render action: :documentation
            # render text: "herp da derp"
          end
        end

        register_instance_option :route_fragment do
          'Documentation'
        end

        register_instance_option :link_icon do
          'icon-book'
        end

        register_instance_option :statistics? do
          true
        end
      end
    end
  end
end