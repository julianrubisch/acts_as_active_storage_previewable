require 'test_helper'

class ActsAsActiveStoragePreviewable::ClassMethods::Test < ActiveSupport::TestCase
  test "instance methods are generated" do
    assert_respond_to Post.new, :featured_image_shim
    assert_not_respond_to Post.new, :downloads_shim
  end

  test "responds_to_missing if no attributes are given" do
    assert_respond_to Topic.new, :featured_image_shim
    assert_respond_to Topic.new, :other_attachment_shim
  end

  # look for a placeholder in app/assets/images/placeholder.png, app/assets/images/placeholders/placeholder.png

  # the list of arguments can also be a hash, containing default and variant specifications
end
