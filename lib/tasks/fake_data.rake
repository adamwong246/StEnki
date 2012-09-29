namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'nokogiri'
    require 'faker'

    Post.delete_all
    Comment.delete_all
    Tag.delete_all
    Tagging.delete_all

    # puts "Rails.root: #{Rails.root}"

    # create the dynamic kitchen sink
    string = File.open(Rails.root + "lib/tasks/kitchenSinkLoremDynamic.xml").read
    doc = Nokogiri::XML.fragment(string, &:noblanks)
    
    puts ""
    doc.traverse do |node|
      alpha  = node.content

      begin
        node.content = eval(node.content)
      rescue Exception => e
        puts "failed to eval(#{node.content} because #{e.to_s})"
      end
      # puts "#{alpha} > #{node.content}"
    end

    Post.create!(:title => 'kitchen sink, dynamic', :body => doc.to_xml(:indent => 2))

    # create the kitchen sink
    Post.create!(:title => 'kitchen sink', :body => File.open(Rails.root + "lib/tasks/kitchenSinkLorem.xml", "rb").read)


    15.times { |i| 
      post = Post.create!(
        :title => Faker::Lorem.sentence(3 + rand(5)), 
        :body => generate_html_body,
        :tag_list => Faker::Lorem.words(1 + rand(3)).join(", "),
        :published_at => rand(1000).days.ago
      )

      create_recur_comments(2 + rand(5), post, nil)
    }


  end

  def generate_html_body
    Faker::Lorem.paragraphs(5 + rand(20)).join(" ")
  end

  def create_recur_comments(number_of_comments, post, parent)

    number_of_comments = number_of_comments.to_i

    number_of_comments.times {|j|

      create_params = Hash.new
      create_params[:author] = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
      create_params[:author_url] = Faker::Internet.domain_name
      create_params[:author_email] = Faker::Internet.email()
      create_params[:body] = Faker::Lorem.paragraphs(1 + rand(5)).join(" ")

      if parent.nil?
        comment = post.comments.create!(create_params)
      else
        create_params[:post] = post
        comment = parent.children.create!(create_params)      
      end

      create_recur_comments(rand(number_of_comments - 1), post, comment)
    }
  end


end
