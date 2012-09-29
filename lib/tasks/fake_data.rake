namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    # require 'populator'
    require 'lorem'
    require 'faker'

    Post.delete_all
    Comment.delete_all
    Tag.delete_all

    25.times { |i| 

      puts "creating post #{i}"

      post = Post.create!(
        :title => Faker::Lorem.sentence(3 + rand(5)), 
        :body => Faker::Lorem.paragraphs(5 + rand(20)).join(" "),
        :tag_list => Faker::Lorem.words(1 + rand(3)).join(", "),
        :published_at => rand(1000).days.ago
      )

      create_recur_comments(2 + rand(5), post, nil)
    }
  end

  def create_recur_comments(number_of_comments, post, parent)

    number_of_comments = number_of_comments.to_i

    number_of_comments.times {|j|

      create_params = Hash.new
      create_params[:author] = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
      create_params[:author_url] = "author url"
      create_params[:author_email] = "email@gmail.com"
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
