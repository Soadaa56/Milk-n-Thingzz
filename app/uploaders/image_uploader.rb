class ImageUploader < Shrine
  # Attacher.validate do
  #   validate_mime_type %w[image/jpeg image/png image/webp]
  #   validate_max_size  10*1024*1024
  # end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      thumbnail:    magick.resize_to_limit(50, 50)
                      .convert("webp")
                      .saver(quality: 50)
                      .call,
      small_card:   magick.resize_to_limit(175, 175)
                      .convert("webp")
                      .saver(quality: 70)
                      .call,
      card:         magick.resize_to_limit(500,500)
                      .convert("webp")
                      .saver(quality: 80)
                      .call,
      detail:       magick.resize_to_limit(1200, 1200)
                      .convert("webp")
                      .saver(quality: 85)
                      .call
    }
  end
end