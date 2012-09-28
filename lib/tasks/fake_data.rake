namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    # require 'populator'
    require 'lorem'
    require 'faker'

    Post.delete_all
    Comment.delete_all

    25.times { |i| 

      puts "creating post #{i}"

      post = Post.create!(
        :title => Faker::Lorem.words(1 + rand(5)).join(" "), 
        :body => Faker::Lorem.paragraphs(5 + rand(20)).join(" "),
        :tag_list => "ruby",
        :published_at => rand(-200..200).days.ago
      )

      create_recur_comments(2 + rand(5), post, nil)

      
    }
  end

  def create_recur_comments(number_of_comments, post, parent)
    
    number_of_comments = number_of_comments.to_i
    puts "number_of_comments: #{number_of_comments}"


    number_of_comments.times {|j|
      if parent.nil?
        c = post.comments.create!(
          :author => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          :author_url => "author url",
          :author_email => "email@gmail.com",
          :body => Faker::Lorem.paragraphs(1 + rand(5)).join(" "),
        )
      else

        c = parent.children.create!(
          :author => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          :author_url => "author url",
          :author_email => "email@gmail.com",
          :body => Faker::Lorem.paragraphs(1 + rand(5)).join(" "),
          :post => post
          )
        
      end

      create_recur_comments(rand(number_of_comments - 1), post, c)
    }
  end

end

