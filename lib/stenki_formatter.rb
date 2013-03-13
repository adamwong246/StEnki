class StenkiFormatter
  class << self
    def format_as_xhtml(text)
      Lesstile.format_as_xhtml(
        text,
        :text_formatter => lambda {|text| RedCloth.new(CGI::unescapeHTML(text)).to_html},
        # :code_formatter => Lesstile::CodeRayFormatter
        :code_formatter => lambda {|code, lang| 

          # the old way. When using line_numbers => :table, code is untruncatable
          # CodeRay.scan(CGI::unescapeHTML(code), lang).div(:line_numbers => :table, :css => :class)
          # this way looks much nicer but lacks line numbers. Does not truncate perfectly as it can cause breaks in the middle of a line. 
          CodeRay.scan(CGI::unescapeHTML(code), lang).div(:css => :class)
          # This looks the 2nd method but line numbers get included in text selection
          # CodeRay.scan(CGI::unescapeHTML(code), lang).div(:css => :class, :line_numbers => :inline)

        }
        
      )
    end
  end
end
