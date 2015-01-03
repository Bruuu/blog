require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "Title should be present" do
    post = build :post, title: "" 
    expect(post).to be_invalid
    post.title = "First"
    expect(post).to be_valid
  end

  it "Title should be unique" do
    create :post, title: "First"
    post = build :post, title: "first"  
    expect(post).to be_invalid
    post.title = "First2"
    expect(post).to be_valid
  end

  it "Content should be present" do
    post = build :post, content: "" 
    expect(post).to be_invalid
    post.content = "First"
    expect(post).to be_valid
  end

  it "Slug should be present" do
    post = build :post, slug: "" 
    expect(post).to be_invalid
    post.slug = "first"
    expect(post).to be_valid
  end

  it "Slug should have valid format" do
    post = build :post, slug: "first post" 
    expect(post).to be_invalid
    post.slug = "First-post"
    expect(post).to be_invalid
    post.slug = "first=post"
    expect(post).to be_invalid
    post.slug = "первый-пост"
    expect(post).to be_invalid
    post.slug = "first_post"
    expect(post).to be_invalid
    post.slug = "first-post-1"
    expect(post).to be_valid
  end
end
