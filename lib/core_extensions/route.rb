module Navigable

  def nav_item(level)
    level.item get_nav_item, get_label, get_url if usable?
  end

  def recursive_nav_items(level, opts = {})

    puts "== RECURSING ON level: #{level}"


    make_nav_leaf_or_branch(level)
    # opts = self.defaults if opts.nil?

    # puts "== opts: #{opts}"



  end

  def make_nav_leaf_or_branch(level, opts = {})
    if usable?
      if get_children.empty?
        make_nav_leaf(level, opts)
        
      else
        make_nav_branch(level, opts)
      end
    end
  end

  def make_nav_leaf(level, opts = self.defaults)

    if opts[:id].is_a?(Fixnum)
      make_nav_leaf(level, {:id => opts[:id]})

    elsif opts[:id].is_a?(Array)  
      opts[:id].each do |i|
        make_nav_leaf(level, {:id => i} )
      end

    else
      make_nav_leaf(level, opts)
    end
  
    level.item get_nav_item, get_label, get_url(opts)
  
  end

  def make_nav_branch(level, opts = self.defaults)

    level.item get_nav_item, get_label, get_url(opts) do |child_level|
      get_children.each do |child|
        child.recursive_nav_items(child_level, opts)
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

  def multi_route?(opts)
    !!defaults[:id]
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
      elsif defaults[:controller] && defaults[:action] && defaults[:id]
        @label ||= "#{defaults[:controller]}_#{defaults[:action]}_#{defaults[:id]}"
      elsif defaults[:controller] && defaults[:action] 
        @label ||= "#{defaults[:controller]}_#{defaults[:action]}"
      else
        @label ||= "--no label--"
      end
    end

    return @label
  end

  def get_url(opts = {})

    # puts "GET URL"
    # puts "required part: #{self.required_parts}"
    # puts "defaults: #{self.defaults.inspect}"

    
    url = path.spec.to_s.sub("(.:format)", '')
    puts "--- old url: #{url}"


    if opts
      opts.each do |key, value| 
        opt_to_string = ":#{key.to_s}"

        puts "replace this: #{opt_to_string} with thie: #{value.to_s}"

        url = url.sub(opt_to_string, value.to_s)


        # puts "out: #{out}"
      end
    end

    puts "new url: #{url}"
    return url

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
