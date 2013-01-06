module Navigable

  def recursive_nav_items(level)

    puts "Recusive generate on #{self.inspect} @ leve: #{level.inspect}"
    
    if usable?

      if get_children.empty?
        level.item get_nav_item, get_label, get_url
      else
        level.item get_nav_item, get_label, get_url do |child_level|

          get_children.each do |child|
            child.recursive_nav_items(child_level)
          end
          # process_recursivly(get_children, child_level)

        end
      end      
    
    end
  end

  def get_regex

    if !@regex
      if get_url =='/'
        @regex ||= Regexp.new("\\A\/{1}[^\/]+$")
      else
        @regex ||= Regexp.new(get_url+"\/[^\/]+{1}$")
      end
    end

    return @regex

  end

  def get_children
    @children ||= Rails.application.routes.routes.select {|r| get_regex =~ r.get_url}
  end

  def get_label

    if !@label
      if defaults[:label]
        @label ||= defaults[:label] 
      elsif name
        @label ||= name 
      elsif defaults[:controller] && defaults[:action]
        @label ||= "#{defaults[:controller]}_#{defaults[:action]}"
      else
        @label ||= "--no label--"
      end
    end

    return @label
  end

  def get_url
    @url ||= path.spec.to_s.sub("(.:format)", '') 
  end

  def get_nav_item
    @nav_item ||= (get_label + "_nav_item").to_sym
  end

  def usable?
    @usable ||= (/^GET$/ == verb || "^GET$" =~ verb)
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
