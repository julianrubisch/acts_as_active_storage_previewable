module ActsAsActiveStoragePreviewable
  # represents a non-existent ActiveStorage attachment
  class NullAttachment
    attr_reader :blob

    # represents a non-existent ActiveStorage blob
    Blob = Struct.new(:content_type) do
      def image?
        content_type.start_with?('image')
      end
    end

    def initialize(content_type: 'image', placeholder:)
      @blob = Blob.new(content_type)
      @placeholder = ActionController::Base.helpers.asset_path(placeholder)
    end

    def variant(_transformations = {})
      @placeholder
    end

    def preview(_transformations = {})
      @placeholder
    end
  end
end
