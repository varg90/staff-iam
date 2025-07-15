# frozen_string_literal: true

RSpec.describe "users/show" do
  before do
    assign(:user, User.create!(
                    email: "Email",
                    password: "Password"
                  ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
  end
end
