namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    # require 'populator'
    require 'lorem'
    require 'faker'

    Post.delete_all

    25.times { |i| 
      Post.create!(
        :title => Faker::Lorem.words(1 + rand(5)).join(" "), 
        :body => Faker::Lorem.paragraphs(5 + rand(20)).join(" "),
        :tag_list => "ruby",
        :published_at => rand(-200..200).days.ago)
    }
    


  end


end

