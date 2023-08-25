require 'rails_helper'

RSpec.describe "deleterequests/show", type: :view do
  before(:each) do
    @deleterequest = assign(:deleterequest, Deleterequest.create!(
      username: "Username",
      comments: "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Comments/)
  end
end
