module ActsAsActiveStoragePreviewable
  module Helpers
    extend ActiveSupport::Concern

    included do
      if respond_to?(:helper_method)
        helper_method :active_storage_preview_for
      end
    end  
  
# - width = local_assigns.fetch(:width) { 512 }
# - height = local_assigns.fetch(:height) { 512 }
# - transformation = local_assigns.fetch(:transformation) { :resize }
# - variation = transformation == :resize_to_fill ? [width, height] : "#{width}x#{height}"
# - css_class = local_assigns.fetch(:css_class) { '' }
# - alt = local_assigns.fetch(:alt) { '' }
# - property = local_assigns.fetch(:property) { '' }
    def active_storage_preview_for(resource, **kw_args)
      content_tag :div do
        if kw_args[:lazy]
          content_tag :div, "TODO spinner here", class: "spinner-container"
          content_tag :div, "TODO lazy load error/image tag", class: "error-container"
        end

        content_tag :div, class: "image-container #{'loading' if kw_args[:lazy]}" do
        end
      end
    end

    def file(resource)
      fields = resource.class.aaasp_fields
      args = resource.class.aaasp_args

      case args
      when -> (args) { args.has_key?(:default) }
        resource.public_send(:"#{args[:default]}_shim")
      else
        case fields
        when -> (fields) { fields.size == 1 }, -> (fields) { fields.size > 1 }
          resource.public_send(:"#{fields.first}_shim")
        end
      end
    end
  end
end

# - if lazy
#     = image_tag('placeholders/placeholder-image-error.svg')
# .image-container class="#{'loading' if lazy}"
#   - if file.blob.image?
#     - image_src = lazy ? one_by_one_pixel : url_for(file.variant(transformation => variation))
#     = image_tag(image_src,
#       alt: alt, class: "img-fluid #{'lazy invisible' if lazy} #{css_class}", width: width, height: height,
#         data: { src: lazy ? url_for(file.variant(transformation => variation)) : '' }, property: property)
#   - elsif file.blob.content_type =~ /pdf/
#     - image_src = lazy ? one_by_one_pixel : url_for(file.preview(transformation => variation))
#     = image_tag(image_src,
#       alt: alt, class: "img-fluid #{'lazy invisible' if lazy} #{css_class}", width: width, height: height,
#       data: { src: lazy ? url_for(file.preview(transformation => variation)) : '' })
