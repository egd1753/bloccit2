require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do
  let(:user) { create(:user) }

  describe "favorite posts" do
    before do
      topic = Topic.create!(name: "Random Topic", description: "Random topic description for testing")
      @post = topic.posts.create!(title: "Random Post Title", body: "Random post body etc. etc.", user: user)
    end

    it "returns 'nil' if user hasn't favorited any posts" do
      expect(user.all_favorite_posts).to be_nil
    end

    it "displays a list of posts favorited by user" do
      favorite = user.favorites.where(post: @post).create
      expect(user.favorite_for(@post)).to eq(favorite)
    end

    it "displays the author's gravtar" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
      expect(user.avatar_url(48)).to eq(expected_gravatar)
    end
  end
end
