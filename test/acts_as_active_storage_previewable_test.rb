require 'test_helper'

class ActsAsActiveStoragePreviewable::Test < ActiveSupport::TestCase
  test "instance methods are generated" do
    assert_respond_to Post.new, :featured_image_shim
    assert_not_respond_to Post.new, :downloads_shim
  end

  test "responds_to_missing if no attributes are given" do
    assert_respond_to Topic.new, :featured_image_shim
    assert_respond_to Topic.new, :other_attachment_shim
  end
end
