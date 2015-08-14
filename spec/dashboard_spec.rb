require "spec_helper"
require "dashboard"

describe Dashboard do
  describe "#posts" do
    it "returns posts visible to the current user" do
      user = double("user")
      posts = double("posts")
      allow(Post).to receive(:visible_to).with(user).and_return(posts)

      dashboard = Dashboard.new(posts: Post.all, user: user)
      result = dashboard.posts

      expect(result).to eq posts
    end
  end
end
