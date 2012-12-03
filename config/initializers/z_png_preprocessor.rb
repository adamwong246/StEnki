class ZpngPreprocessor < Sprockets::Processor
  self.default_mime_type = 'image/png'

  def evaluate(context, locals)

    puts "ZpngPreprocessor called"

    png = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
    png[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
    png[2,1] = ChunkyPNG::Color('black @ 0.5')

    # return data.gsub(%r"\bpng\b", "HERP DA DERP")
    data = png
    return data
  end
end

Rails.application.assets.register_processor('application/zpng', ZpngPreprocessor)
