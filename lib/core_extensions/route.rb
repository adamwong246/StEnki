module Navigable

      def get_regex
        @regex ||= Regexp.new(get_url+".+")
      end

      def get_children
        @children ||= Rails.application.routes.routes.select {|r| get_regex =~ r.get_url}
      end

      def get_label

        return get_url

        # if !@label
        #   if defaults[:label]
        #     @label ||= defaults[:label] 
        #   elsif name
        #     @label ||= name 
        #   elsif defaults[:controller] && defaults[:action]
        #     @label ||= "#{defaults[:controller]}_#{defaults[:action]}"
        #   else
        #     @label ||= "no label"
        #   end
        # end

        # return @label
      end

      def get_url
        @url ||= path.spec.to_s.sub("(.:format)", '')
      end

      def get_nav_item
        @nav_item ||= (get_label + "_nav_item").to_sym
      end

      def usable?
        @usable ||= /^GET$/ == verb || "^GET$" =~ verb
      end
end

module CoreExtensions
  module Journey
    module Route
      include Navigable

      def initialize
        initialize_navigable
        # initialize person
      end
    
    end
  end
end

Journey::Route.send(:include, CoreExtensions::Journey::Route)
