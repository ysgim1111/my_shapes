class ProductBasicUploader < ImageBaseUploader
  process resize_to_fit: [600, 600]
  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [250, 250]

    def default_url
      "thumb_default_#{model.class.to_s.underscore}.png"
    end
  end
end
