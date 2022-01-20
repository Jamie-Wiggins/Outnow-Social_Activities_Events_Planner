require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  # failure case: should not save post with no value present
  test "should not save post with no values present" do
    post = Post.new
    refute post.valid?
    refute post.save
  end

  # success case: should save post with valid parameters
  test "should save valid post" do
    post = Post.new
    post.title = "Post Title"
    post.content = "Post Content"
    assert post.valid?
    assert post.save
  end

  # success case: should not save post with null title
  test "should not save post with null title" do
    post = Post.new
    post.content = "Post Content"
    refute post.valid?
    refute post.save
  end

  # success case: should not save post with invalid title
  test "should not save post with title less than 3 long" do
    post = Post.new
    post.title = "a"
    post.content = "Post Content"
    refute post.valid?
    refute post.save
  end

  # success case: should not save post with invalid title
  test "should not save post with title more than 30 long" do
    post = Post.new
    post.content = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    post.content = "Post Content"
    refute post.valid?
    refute post.save
  end
  
  # failure case: should not save post with null content
  test "should not save post with no content" do
    post = Post.new
    post.title = "Post Title"
    refute post.valid?
    refute post.save
  end
end