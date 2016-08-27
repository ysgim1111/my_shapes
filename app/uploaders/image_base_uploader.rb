# encoding: utf-8

class ImageBaseUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    "default_#{model.class.to_s.underscore}.png"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def content_type_whitelist
    /image\//
  end
end
