require 'spec_helper'

describe "identities/edit" do
  before(:each) do
    @identity = assign(:identity, stub_model(Identity))
  end

  it "renders the edit identity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => identities_path(@identity), :method => "post" do
    end
  end
end
