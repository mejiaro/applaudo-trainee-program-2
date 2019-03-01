require "spec_helper"
require "signup"

describe Signup do
  describe "#save" do
    it "creates an account with one user" do
      account = double("account")
      user = double("user")
      allow(Account).to receive(:create!).and_return(account)
      allow(User).to receive(:create!).and_return(user)
      signup = Signup.new(
        account_name: "Example",
        email: "user@example.com"
      )

      result = signup.save

      expect(result).to be(true)
      expect(Account).to have_received(:create!).with(name: "Example")
    end
  end

  describe "#user" do
    it "returns the user created by #save" do
      account = double("account")
      user = double("user")
      allow(Account).to receive(:create!).and_return(account)
      allow(User).to receive(:create!).and_return(user)

      signup = Signup.new(email: "user@example.com", account_name: "Example")
      signup.save

      result = signup.user

      expect(result).to eql(user)
      expect(Account).to have_received(:create!).with(name: "Example")
    end
  end
end
