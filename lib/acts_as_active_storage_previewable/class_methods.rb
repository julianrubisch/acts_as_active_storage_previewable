module ActsAsActiveStoragePreviewable
  module ClassMethods
    def acts_as_active_storage_previewable_on(fields)
      acts_as_active_storage_previewable(fields)
    end

    def acts_as_active_storage_previewable(fields = {})
      if fields.empty?
        define_method :method_missing do |method_name, *args, &block|
          if /(.*)_shim\Z/.match?(method_name)
            if public_send(prefix(method_name)).attached?
              public_send(prefix(method_name))
            else
              ActsAsActiveStoragePreviewable::NullAttachment.new(placeholder: args[0])
            end
          else
            super(method_name, *args, &block)
          end
        end

        define_method :respond_to_missing? do |method_name, include_private = false|
          if /(.*)_shim\Z/.match?(method_name)
            attachments = self.class.reflect_on_all_associations.select do |assoc|
              assoc.klass == ActiveStorage::Attachment
            end

            attachments.map(&:name).map(&:to_s).include? "#{prefix(method_name)}_attachment"
          else
            super(method_name, include_private)
          end
        end
      else
        Array(fields).each do |attachment_key|
          define_method :"#{attachment_key}_shim" do |*args|
            if public_send(attachment_key).attached?
              public_send(attachment_key)
            else
              ActsAsActiveStoragePreviewable::NullAttachment.new(placeholder: args[0])
            end
          end
        end
      end

      define_method :prefix do |method_name|
        (/(.*)_shim\Z/.match method_name.id2name)[1]
      end
    end
  end
end
