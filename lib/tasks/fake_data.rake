namespace :db do
  desc "Erase database"
  task :clear => :environment do
    # clear out old stuff
    Post.delete_all
    Comment.delete_all
    Tag.delete_all
    Tagging.delete_all
  end
end
