class ImageUploader < Shrine
  Attacher.derivatives do |original|
    vips = ImageProcessing::Vips.source(original)
    {
      small:        vips.resize_to_fill(180, 180)
                      .convert("webp")
                      .saver(q: 61, strip: true)
                      .call,
      card:         vips.resize_to_fill(500,500)
                      .convert("webp")
                      .saver(q: 75, strip: true)
                      .call,
      detail:       vips.resize_to_limit(1200, 1200)
                      .convert("webp")
                      .saver(q: 82, strip: true)
                      .call
    }
  end
end