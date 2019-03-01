require "spec_helper"
require "dashboard"

describe Dashboard do
  describe "#posts" do
    it "returns posts visible to the current user" do
      posts = double("posts")
      user = double("user")
      post_visible = double("post_visible")
      allow(posts).to receive(:visible_to).with(user).and_return(post_visible)

      result = Dashboard.new(posts: posts, user: user).posts
      expect(result).to eq(post_visible)

    end
  end
end
