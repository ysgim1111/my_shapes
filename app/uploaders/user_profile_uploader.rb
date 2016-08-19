class UserProfileUploader < ImageBaseUploader
  version :thumb do
    process resize_to_fit: [50, 50]

    def default_url
      "default_user_thumb.png"
    end
  end
end
