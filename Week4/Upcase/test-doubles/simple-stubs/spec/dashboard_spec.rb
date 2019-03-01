require "spec_helper"
require "dashboard"

describe Dashboard do
  describe "#posts" do
    it "returns posts created today" do
      posts_created = double("created_today")
      allow(Post).to receive(:today).and_return(posts_created)
      dashboard = Dashboard.new(posts: Post)
      result = dashboard.todays_posts
      expect(result).to eq(posts_created)
    end
  end

  around do |example|
    Timecop.freeze { example.run }
  end
end
