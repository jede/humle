# encoding: utf-8
require "mini_spec_helper"

require APP_ROOT + '/app/models/beer'
require APP_ROOT + '/app/importers/beer_importer'

describe BeerImporter do
  before do
    Beer.destroy_all
    io = StringIO.new(%{
      <?xml version="1.0" standalone="yes"?>
      <artiklar>  
        <artikel>
          <nr>1102703</nr>
          <Artikelid>604810</Artikelid>
          <Varnummer>11027</Varnummer>
          <Namn>Nils Oscar</Namn>
          <Namn2>Coffee Stout</Namn2>
          <Prisinklmoms>21.9000</Prisinklmoms>
          <Volymiml>330.0000</Volymiml>
          <PrisPerLiter>66.3600</PrisPerLiter>
          <Saljstart>20111101</Saljstart>
          <Slutlev />
          <Varugrupp>Öl, Porter och Stout</Varugrupp>
          <Forpackning>Flaska</Forpackning>
          <Forslutning />
          <Ursprung>Södermanlands län, Nyköpings kommun</Ursprung>
          <Ursprunglandnamn>Sverige</Ursprunglandnamn>
          <Producent>Nils Oscar Company</Producent>
          <Leverantor>The Nils Oscar Company AB</Leverantor>
          <Argang>2005</Argang>
          <Provadargang>0</Provadargang>
          <Alkoholhalt>6.4%</Alkoholhalt>
          <Modul>T5</Modul>
          <Sortiment>TSE</Sortiment>
          <Ekologisk>1</Ekologisk>
          <Koscher>0</Koscher>
          <RavarorBeskrivning>Kornmalt och humle.</RavarorBeskrivning>
        </artikel>
      </artiklar>
    })
    @importer = BeerImporter.new(io)
    @importer.import!
  end

  describe "imported beer" do
    let(:beer) { Beer.first }
    it "should have all attributes" do
      beer.type.should == "Porter och Stout"
      beer.name.should == "Nils Oscar"
      beer.description.should == "Coffee Stout"
      beer.producer_name.should == "Nils Oscar Company"
      beer.year.should == 2005
      beer.country.should == "Sverige"
      beer.region.should == "Södermanlands län, Nyköpings kommun"
      beer.bolaget_id.should == 11027
      beer.alcohol_content.should == 0.064
      beer.organic.should == true
    end
  end
end

