require 'rails_helper'

RSpec.describe "deleterequests/index", type: :view do
  before(:each) do
    assign(:deleterequests, [
      Deleterequest.create!(
        username: "Username",
        comments: "Comments"
      ),
      Deleterequest.create!(
        username: "Username",
        comments: "Comments"
      )
    ])
  end

  it "renders a list of deleterequests" do
    render
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Comments".to_s, count: 2
  end
end
