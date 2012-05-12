class ApplicationController < ActionController::Base
  protect_from_forgery

  def foursquare
    id = "PQUUGARXHM5L4RL4R32XRCVI3PSHC0UKIURVGFP2M5GCF1UO"
    secret = "XPQ1NVXXQSZI1VDIR4D1Z4ZQVQZWW5SXIJZVMAPKXEECDL50"
    @foursquare ||= Foursquare::Base.new(id, secret)
  end
end
