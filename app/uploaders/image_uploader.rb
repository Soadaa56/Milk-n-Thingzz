class ImageUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      small:   magick.resize_to_fill(180, 180)
                      .convert("webp")
                      .saver(quality: 63)
                      .call,
      card:         magick.resize_to_fill(500,500)
                      .convert("webp")
                      .saver(quality: 78)
                      .call,
      detail:       magick.resize_to_limit(1200, 1200)
                      .convert("webp")
                      .saver(quality: 83)
                      .call
    }
  end
end