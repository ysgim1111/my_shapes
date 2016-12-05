class InfluencerReviewPhotoUploader < ImageBaseUploader
  process resize_to_fit: [245, 245]
end
