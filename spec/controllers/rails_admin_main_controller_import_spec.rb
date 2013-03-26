require "spec_helper"
include Warden::Test::Helpers

describe RailsAdmin::MainController do
  describe "importing" do
    include Devise::TestHelpers

    it "routes to #index" do
      @user = FactoryGirl.create(:user)
      # session[:user_id] = user.id # log in user however you like, alternatively stub `current_user` method
      sign_in @user
      
      post :import, :file => {}
      # post "/widgets", :widget => {:name => "My Widget"}


      # :form_data => {
      #   "utf8"=>"✓", 
      #   "authenticity_token"=>"Vl4c1a+15mNw8BjyztZVLvSziLrwTNqDOo2bb9jTgIc=", 
      #   "file"=>#<ActionDispatch::Http::UploadedFile:0x00000105ae7440 
      #     @original_filename="post_2013-03-02_17h09m58.csv", 
      #     @content_type="text/csv", 
      #     @headers="Content-Disposition: form-data; name=\"file\"; filename=\"post_2013-03-02_17h09m58.csv\"\r\nContent-Type: text/csv\r\n", @tempfile=#<File:/var/folders/3g/nzm70s951qnc6vg3vdx9mx6c0000gp/T/RackMultipart20130305-25253-dwmljv>>, "commit"=>"Upload", "model_name"=>"post"}
    end

    # it "routes to #new" do
    #   get("/widgets/new").should route_to("widgets#new")
    # end

    # it "routes to #show" do
    #   get("/widgets/1").should route_to("widgets#show", :id => "1")
    # end

    # it "routes to #edit" do
    #   get("/widgets/1/edit").should route_to("widgets#edit", :id => "1")
    # end

    # it "routes to #create" do
    #   post("/widgets").should route_to("widgets#create")
    # end

    # it "routes to #update" do
    #   put("/widgets/1").should route_to("widgets#update", :id => "1")
    # end

    # it "routes to #destroy" do
    #   delete("/widgets/1").should route_to("widgets#destroy", :id => "1")
    # end

  end
end
