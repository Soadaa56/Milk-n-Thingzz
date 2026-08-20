Rails.application.config.dartsass.tap do |dartsass|
  dartsass.build_options = [
    "--load-path", Rails.root.join("node_modules").to_s
  ]
end