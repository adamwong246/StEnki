require 'rubygems'
require 'nokogiri'
require 'faker'

string = File.open("kitchenSinkLoremDynamic.xml").read
doc = Nokogiri::XML.fragment(string, &:noblanks)

# puts doc

doc.traverse do |node|
  alpha  = node.content

  begin
    new_content = eval(node.content)
    # puts new_content + ", " + node.content
    node.content = new_content.inspect

    # new_content = eval(node.content)
    
    # if new_content.array? 
    #   node.content = new_content.first
    # else
    #   node.content = new_content
    # end

    
  rescue Exception => e
    puts "failed on #{node} because: #{e.to_s}"
  end
end

# puts doc