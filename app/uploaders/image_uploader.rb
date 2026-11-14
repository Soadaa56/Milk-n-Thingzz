class ImageUploader < Shrine
  Attacher.derivatives do |original|
    vips = ImageProcessing::Vips.source(original)
    {
      small:        vips.resize_to_fill(180, 180)
                      .convert("webp")
                      .saver(Q: 60, strip: true)
                      .call,
      card:         vips.resize_to_fill(540,540)
                      .convert("webp")
                      .saver(Q: 71, strip: true)
                      .call,
      detail:       vips.resize_to_limit(1000, 1000)
                      .convert("webp")
                      .saver(Q: 79, strip: true)
                      .call
    }
  end
end