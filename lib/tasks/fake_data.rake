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

      p = Post.create!(
        :title => Faker::Lorem.words(1 + rand(5)).join(" "), 
        :body => Faker::Lorem.paragraphs(5 + rand(20)).join(" "),
        :tag_list => "ruby",
        :published_at => rand(-200..200).days.ago
      )

      rand(5).times {|j|
        # puts "- creating comment #{j}"
        c = p.comments.create!(
          :author => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          :author_url => "author url",
          :author_email => "email@gmail.com",
          :body => Faker::Lorem.paragraphs(1 + rand(5)).join(" ")
        )

        c.children.create!(
          :author => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          :author_url => "author url",
          :author_email => "email@gmail.com",
          :body => Faker::Lorem.paragraphs(1 + rand(5)).join(" "),
          :post => p
        )
      }
    }
    


  end


end

