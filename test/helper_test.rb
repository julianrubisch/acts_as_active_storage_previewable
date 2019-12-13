require 'test_helper'

class ActsAsActiveStoragePreviewable::Helpers::Test < ActionView::TestCase
  # test helper
  # active_storage_preview_for
  test "returns a preview for the first attachment in the list, if no arguments are given" do
    assert_dom_equal %{<div><div class="image-container "></div></div>}, active_storage_preview_for(Post.new)   
  end

  # utility methods
  # file
  test "if only one preview is available, return that" do
    post = Post.new
    post.featured_image.attach(io: File.open(File.expand_path('./test/fixtures/test.jpg')), filename: 'test.jpg')
    post.save

    assert_equal post.featured_image_shim, file(post)
  end

  test "if multiple previews are available, return the first" do
    page = Page.new
    page.thumbnail.attach(io: File.open(File.expand_path('./test/fixtures/test.jpg')), filename: 'test.jpg')
    page.save

    assert_equal page.thumbnail_shim, file(page)
  end

  test "if a default key is present, take that" do
    category = Category.new
    category.featured_image.attach(io: File.open(File.expand_path('./test/fixtures/test.jpg')), filename: 'test.jpg')
    category.save

    assert_equal category.featured_image_shim, file(category)
  end

  # test null attachment if no image attached
  # test rescue if default key is present, but invalid
end
