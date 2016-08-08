class ProductUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    "/images/" + [version_name, "default.png"].compact.join('_')
  end

  process resize_to_fit: [600, 600]
  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [182, 136]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def content_type_whitelist
    /image\//
  end
end
