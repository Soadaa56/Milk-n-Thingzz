class ImageUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      small:   magick.resize_to_fill(200, 200)
                      .convert("webp")
                      .saver(quality: 65)
                      .call,
      card:         magick.resize_to_fill(600,600)
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