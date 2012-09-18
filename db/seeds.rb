# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.delete_all
User.create!({:email => "adamwong246@gmail.com", :roles => ["admin"], :password => "password", :password_confirmation => "password" })
User.create!({:email => "guest@gmail.com", :roles => ["guest"], :password => "password", :password_confirmation => "password" })
Post.create!({:title => 'lorem', :slug => 'lorem', :body => 'lorem'})