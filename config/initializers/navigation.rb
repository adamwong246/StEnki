SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :books, 'Books', "books_path"
    primary.item :music, 'Music', "books_path"
    primary.item :dvds, 'Dvds', "books_path"

    Rails.application.routes.routes.each do |r|
      if 'GET' =~ r.verb
      # .well
      #   p
      #     = "Route: " + r.inspect
      #   p
      #     = "Name: " + r.name.to_s
      #   p
      #     = "Verb: " + r.verb.inspect
      #   p
      #     = "Constraints: " + r.constraints.inspect
      end
    end
  end
end 