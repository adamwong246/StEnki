namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    # require 'populator'
    # require 'faker'
    Post.delete_all

    25.times { |i| 
      Post.create!(:title => (0...8).map{65.+(rand(25)).chr}.join, 
        :body => (0...256).map{65.+(rand(25)).chr}.join, 
        :tag_list => "ruby",
        :published_at => rand(-200..200).days.ago)
    }
    


  end


end

