RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      email: "MyString",
      password_digest: "MyString",
      role: "MyString",
      login_code: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do
      assert_select "input[name=?]", "user[email]"
      assert_select "input[name=?]", "user[password_digest]"
      assert_select "input[name=?]", "user[role]"
      assert_select "input[name=?]", "user[login_code]"
    end
  end
end
