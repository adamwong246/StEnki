SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :books, 'Books', "books_path"
    primary.item :music, 'Music', "books_path"
    primary.item :dvds, 'Dvds', "books_path"
  end
end 