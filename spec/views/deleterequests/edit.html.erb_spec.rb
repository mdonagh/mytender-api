require 'rails_helper'

RSpec.describe "deleterequests/edit", type: :view do
  before(:each) do
    @deleterequest = assign(:deleterequest, Deleterequest.create!(
      username: "MyString",
      comments: "MyString"
    ))
  end

  it "renders the edit deleterequest form" do
    render

    assert_select "form[action=?][method=?]", deleterequest_path(@deleterequest), "post" do

      assert_select "input[name=?]", "deleterequest[username]"

      assert_select "input[name=?]", "deleterequest[comments]"
    end
  end
end
