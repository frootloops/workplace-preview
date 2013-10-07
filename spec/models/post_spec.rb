require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  describe ".scopes" do
    describe ".chronological" do
      it "return ordered posts" do
        post1 = create(:post)
        post2 = create(:post)
        expect(Post.chronological).to eq [post2, post1]
      end
    end
  end
end
