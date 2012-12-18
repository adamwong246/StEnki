require 'nokogiri'
require 'faker'

# explain(self) 
def render_erb(template_path, params)  
  view = ActionView::Base.new(ActionController::Base.view_paths, {})  
  
  class << view  
    include EmailHelper, ApplicationHelper  
  end  
  
  view.render(:file => "#{template_path}.html.erb", :locals => params)  
end

# explain(self) 
def make_a_lorem_comment(post, parent)
  return

  create_params = Hash.new
  create_params[:author] = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  create_params[:author_url] = Faker::Internet.domain_name
  create_params[:author_email] = Faker::Internet.email()

  # choose these two terms at your own discretion
  create_params[:body] = Faker::Lorem.paragraphs(2 + rand(5)).join(" ")

  if parent.nil?
    comment = post.comments.create!(create_params)
  else
    create_params[:post] = post
    comment = parent.children.create!(create_params)      
  end

  return comment
end

# creates a wide tree with a single parent. All nodes are sibling leaves.
def create_recur_comments_wide(number_of_comments, post, parent)
  number_of_comments = number_of_comments.to_i

  number_of_comments.times do
    make_a_lorem_comment(post, parent) 
  end
end

# creates a single straight branch of comments. Single child, no sibblings
def create_recur_comments_straight(number_of_comments, post, parent)
  number_of_comments = number_of_comments.to_i

  if (number_of_comments > 0)
    create_recur_comments_straight(number_of_comments - 1, post, make_a_lorem_comment(post, parent))
  end
end

# creates a 'natural' looking, randomized tree of comments
# each child will have a random number of children between 0 and 1 less than it's parents children.
def create_recur_comments_natural(number_of_comments, post, parent)
  number_of_comments = number_of_comments.to_i

  number_of_comments.times {|j|
    create_recur_comments_natural(rand(number_of_comments - 1), post, make_a_lorem_comment(post, parent))
  }
end


# Create users
#################################
User.find_or_create_by_email({:email => "adamwong246@gmail.com", :roles => ["admin"], :password => "password", :password_confirmation => "password" })
User.find_or_create_by_email({:email => "guest@gmail.com", :roles => ["guest"], :password => "password", :password_confirmation => "password" })

# Create test posts
###########################################
fake_posts_path = Rails.root + "lib/tasks/fake_posts/"

string = File.open(Rails.root + "lib/tasks/fake_posts/lorem.erb").read
renderer = ERB.new(string)
Post.find_or_create_by_title(:title => 'lorem.erb', :body => renderer.result())

# We could use an xml (or html!) file
Post.find_or_create_by_title(:title => 'kitchen_sink.xml', :body => File.open(fake_posts_path  + "kitchen_sink.xml", "rb").read)

# TODO these instructions don't work yet
# or even a slim file
# template = Slim::Template.new { File.open(fake_posts_path  + "lorem.slim").read }
# post = Post.create!(
#     :title => fake_posts_path  + "lorem.slim", 
#     :body => template
#   )

#########################################
# Now we want a large number of filler posts of nice looking but randomized html
# For images, use File.open(Rails.root + "lib/tasks/lorem_post_with_images.erb").read
# erb2 = File.open(fake_posts_path  + "lorem_post_with_images.erb").read
# For no image
erb2 = File.open(fake_posts_path  + "lorem_post_with_images.erb").read

# We want to test the limits of the depth of trees
# Let's make a post with long deep tree with no branches
post = Post.find_or_create_by_title(
  :title => "Straight", 
  :body => ERB.new(erb2).result(),
)
create_recur_comments_straight(10, post, nil)

# Now, instead of a very deep tree, let's create a very wide tree
# Makes a post with a wide shallow tree with a single parent
post = Post.find_or_create_by_title(
  :title => "Wide", 
  :body => ERB.new(erb2).result(),
)
create_recur_comments_wide(10, post, nil)

# Makes a lot of 'natural' posts
10.times { |i| 

  post = Post.find_or_create_by_title(
    :title => Faker::Lorem.sentence(3 + rand(5)), 
    :body => ERB.new(erb2).result(),
    :tag_list => Faker::Lorem.words(1 + rand(3)).join(", "),
    :published_at => rand(1000).days.ago
  )

  # Choose these terms at your own discretion
  create_recur_comments_natural(4 + rand(5), post, nil)
}
