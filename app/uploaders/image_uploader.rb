class ImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    # validate_max_size  10*1024*1024
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      thumbnail:  magick.resize_to_limit!(50, 50),
      small: magick.resize_to_limit!(180, 180),
      medium: magick.resize_to_limit!(300,300),
      large: magick.resize_to_limit!(500,500)
    }
  end
end