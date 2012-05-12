class Place
  include Mongoid::Document
  field :foursquare_id, :type => String
  field :name, :type => String

  def self.from_foursquare(params)
    foursquare.venues.search(params)['nearby'].map do |venue|
      place = Place.where(conditions: {foursquare_id: venue.id}).first
      unless place
        place = Place.create!(foursquare_id: venue.id, name: venue.name)
      end
      place
    end
  end

  def to_s
    name
  end
  
  protected

  def self.foursquare
    id = "PQUUGARXHM5L4RL4R32XRCVI3PSHC0UKIURVGFP2M5GCF1UO"
    secret = "XPQ1NVXXQSZI1VDIR4D1Z4ZQVQZWW5SXIJZVMAPKXEECDL50"
    @foursquare ||= Foursquare::Base.new(id, secret)
  end
end
