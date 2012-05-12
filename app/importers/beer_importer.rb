# encoding: utf-8
require 'nokogiri'
require 'scanf'

class BeerImporter
  def initialize(io, options = {})
    @io = io
    @options = options
  end

  def import!
    doc = Nokogiri::XML(@io)
    doc.css("artikel").each do |artikel|
      type = node_text(artikel, "Varugrupp").scan(/Öl,\s(.*)/).flatten.first
      next unless type

      beer = Beer.new(type: type)

      { name: "Namn",
        description: "Namn2",
        producer_name: "Producent",
        country: "Ursprunglandnamn",
        region: "Ursprung",
        year: "Argang",
        bolaget_id: "Varnummer",
        alcohol_percent: "Alkoholhalt",
        organic: "Ekologisk"
      }.each do |attribute, name|
        beer.send("#{attribute}=".to_sym, node_text(artikel, name))
      end

      puts beer.full_name if @options[:verbose]
      beer.save!
    end
  end

  private

  def node_text(data, name)
    data.css(name).text
  end
end
