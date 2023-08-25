require 'rails_helper'

RSpec.describe "deleterequests/new", type: :view do
  before(:each) do
    assign(:deleterequest, Deleterequest.new(
      username: "MyString",
      comments: "MyString"
    ))
  end

  it "renders new deleterequest form" do
    render

    assert_select "form[action=?][method=?]", deleterequests_path, "post" do

      assert_select "input[name=?]", "deleterequest[username]"

      assert_select "input[name=?]", "deleterequest[comments]"
    end
  end
end
