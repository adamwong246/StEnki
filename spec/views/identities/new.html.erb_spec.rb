require 'spec_helper'

describe "identities/new" do
  before(:each) do
    assign(:identity, stub_model(Identity).as_new_record)
  end

  it "renders new identity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => identities_path, :method => "post" do
    end
  end
end
