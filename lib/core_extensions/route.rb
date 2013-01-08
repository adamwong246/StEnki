module Navigable

  def nav_item(level)
    if usable?

      orig_url = get_url

      self.path.names.each do |name|
        puts "name: " + name
        puts self.defaults

        if self.defaults[name.to_sym].is_a? ( Fixnum ) 
          url = get_url({name => self.defaults[name.to_sym]})
          level.item get_nav_item, get_label, url if !url.include?(":")    

        elsif self.defaults[name.to_sym].is_a? (Array )
          self.defaults[name.to_sym].each do |default|
            
            puts default
            url = get_url({name => default})
            level.item get_nav_item, get_label, url if !url.include?(":")

          end
        else
          url = get_url
          level.item get_nav_item, get_label, url if !url.include?(":")
        end
      end

      # level.item get_nav_item, get_label, get_url
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


  def get_label

    
    if !@label
      if self.defaults[:label]
        @label ||= defaults[:label] 
      elsif name
        @label ||= name
      elsif !!self.defaults 
        @label ||= self.defaults.inspect
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

    
    url = path.spec.to_s#.sub("(.:format)", '')
    old_url = url

    if !!opts[:format]
      url = url.sub("(.:format)", ".#{opts[:format]}")
    else
      url = url.sub("(.:format)", "")
    end

    puts "--- old url: #{url}"


    if opts
      opts.each do |key, value| 
        opt_to_string = ":#{key.to_s}"

        puts "replace this: #{opt_to_string} with this: #{value.to_s}"

        url = url.sub(opt_to_string, value.to_s)


        # puts "out: #{out}"
      end
    end

    puts "--- new url: #{url}"
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
        # initialize_navigable
        # initialize person
      end
    
    end
  end
end

# Journey::Route.send(:include, CoreExtensions::something::navitem)
Journey::Route.send(:include, CoreExtensions::Journey::Route)
