module ApplicationHelper

  def current_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  # Turn a collection into html
  def ultrahumanize(collection)
  xhtml = Builder::XmlMarkup.new :target => out=(''), :indent => 2

    begin
      if !collection.kind_of?(Array)
        collection = [collection]
      end

      xhtml.div(:class => "ultrahumanized"){
        xhtml.strong("#{collection.first.class.name}")
        
        xhtml.table(:class => "table table-bordered table-stripe") {
          xhtml.tr{
            collection.first.attributes.keys.each do |attribute|
              xhtml.td(attribute)
            end

            xhtml.td("Show link")

          }

          collection.each do |single_thing|          
            xhtml.tr{
              single_thing.attributes.keys.each do |attribute|
                xhtml.td{
                  xhtml.target! << (best_in_place single_thing, attribute.to_sym).to_s
                }
              end

              xhtml.td{
                xhtml.a( { :href => url_for(:id => single_thing.id), :method => 'delete' }, 'Destroy' )
              }

            }
          end
        }  
      }
    rescue StandardError => bang
      return xhtml.strong(bang)
    end
  end


end
