RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "Email",
        password_digest: "Password Digest",
        role: "Role",
        login_code: "Login Code"
      ),
      User.create!(
        email: "Email",
        password_digest: "Password Digest",
        role: "Role",
        login_code: "Login Code"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password Digest".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Role".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Login Code".to_s), count: 2
  end
end
