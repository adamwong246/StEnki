class EnkiFormatter
  class << self
    def format_as_xhtml(text)
      Lesstile.format_as_xhtml(
        text,
        :text_formatter => lambda {|text| RedCloth.new(CGI::unescapeHTML(text)).to_html},
        # :code_formatter => Lesstile::CodeRayFormatter
        :code_formatter => lambda {|code, lang| 
          CodeRay.scan(CGI::unescapeHTML(code), lang).div(:line_numbers => :table, :css => :class)
        }
        
      )
    end
  end
end
