module ActsAsActiveStoragePreviewable
  class Railtie < ::Rails::Railtie
    initializer 'connect active record to acts_as_active_storage_previewable' do
      ActiveSupport.on_load(:active_record) do
        include ActsAsActiveStoragePreviewable
        extend ActsAsActiveStoragePreviewable::ClassMethods
      end
    end
  end
end
