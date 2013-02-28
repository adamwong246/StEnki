class ZpngPreprocessor < Sprockets::Processor
  self.default_mime_type = 'image/png'

  def evaluate(context, locals)

    puts "ZpngPreprocessor called"

    image = ChunkyPNG::Image.from_file('_zpng_test.png')

    new_image = image.flip_horizontally.rotate_right
    data = new_image
    return data
  end
end

Rails.application.assets.register_preprocessor('application/zpng', ZpngPreprocessor)
