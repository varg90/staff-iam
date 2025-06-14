RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      email: "Email",
      password_digest: "Password Digest",
      role: "Role",
      login_code: "Login Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Login Code/)
  end
end
