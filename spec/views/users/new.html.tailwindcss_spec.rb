# frozen_string_literal: true

RSpec.describe "users/new" do
  before do
    assign(:user, User.new(
                    email: "MyString",
                    password_digest: "MyString",
                    role: "MyString",
                    login_code: "MyString"
                  ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input[name=?]", "user[email]"
      assert_select "input[name=?]", "user[password_digest]"
      assert_select "input[name=?]", "user[role]"
      assert_select "input[name=?]", "user[login_code]"
    end
  end
end
