require 'spec_helper'

describe "identities/index" do
  before(:each) do
    assign(:identities, [
      stub_model(Identity),
      stub_model(Identity)
    ])
  end

  it "renders a list of identities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
