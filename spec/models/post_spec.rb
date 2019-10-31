require "rails_helper"

describe Post do
  describe "#permalink" do
    describe "given valid title" do
      it "will generate valid permalink" do
        post = Post.new title: "Ruby is Awesome", content: "testing."
        expect(post.permalink).to eq "ruby_is_awesome"
      end
    end

    describe "given blank between title" do
      it "will strip blank char and generate valid permalink" do
        post = Post.new title: " Ruby is Awesome    ", content: "testing."
        expect(post.permalink).to eq "ruby_is_awesome"
      end
    end
  end
end
