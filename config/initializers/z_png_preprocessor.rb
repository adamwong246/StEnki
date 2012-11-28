class ZPngPreprocessor < Sprockets::Processor
  def evaluate(context, locals)
    png = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
    png[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
    png[2,1] = ChunkyPNG::Color('black @ 0.5')

    data = png
  end
end

Rails.application.assets.register_preprocessor('image/png', ZPngPreprocessor)