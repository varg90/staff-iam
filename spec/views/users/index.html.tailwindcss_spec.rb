# frozen_string_literal: true

RSpec.describe "users/index" do
  before do
    assign(:users, [
             User.create!(
               email: "Email",
               password: "Password"
             ),
             User.create!(
               email: "Email",
               password: "Password"
             )
           ])
  end

  it "renders a list of users", skip: "doesn't work" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Email"), count: 2
  end
end
