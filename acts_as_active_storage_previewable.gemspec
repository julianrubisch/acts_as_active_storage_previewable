$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "acts_as_active_storage_previewable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "acts_as_active_storage_previewable"
  spec.version     = ActsAsActiveStoragePreviewable::VERSION
  spec.authors     = ["Julian Rubisch"]
  spec.email       = ["julian@julianrubisch.at"]
  spec.homepage    = "https://github.com/julianrubisch/acts_as_active_storage_previewable"
  spec.summary     = "A Rails model mixin to provide zero-config ActiveStorage previews with placeholders"
  spec.description = "A Rails model mixin to provide zero-config ActiveStorage previews with placeholders"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.2"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "structured_changelog"
end
