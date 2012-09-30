namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'nokogiri'
    require 'faker'

    Post.delete_all
    Comment.delete_all
    Tag.delete_all
    Tagging.delete_all

    string = File.open(Rails.root + "lib/tasks/lorem.erb").read
    renderer = ERB.new(string)
    Post.create!(:title => 'lorem.erb', :body => renderer.result())

    Post.create!(:title => 'kitchen sink', :body => File.open(Rails.root + "lib/tasks/kitchenSinkLorem.xml", "rb").read)

    # template = Slim::Template.new { File.open(Rails.root + "lib/tasks/lorem.slim").read }
    erb2 = File.open(Rails.root + "lib/tasks/lorem2.erb").read
    15.times { |i| 
    
      post = Post.create!(
        :title => Faker::Lorem.sentence(3 + rand(5)), 
        # :body => template.render,
        :body => ERB.new(erb2).result(),
        :tag_list => Faker::Lorem.words(1 + rand(3)).join(", "),
        :published_at => rand(1000).days.ago
      )

      create_recur_comments(2 + rand(5), post, nil)
    }


  end

  def render_erb(template_path, params)  
    view = ActionView::Base.new(ActionController::Base.view_paths, {})  
    
    class << view  
      include EmailHelper, ApplicationHelper  
    end  
    
    view.render(:file => "#{template_path}.html.erb", :locals => params)  
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
