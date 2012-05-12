# encoding: utf-8
class Beer
  include Mongoid::Document
  include Mongoid::FullTextSearch

  field :name, :type => String
  field :description, :type => String
  field :producer_name, :type => String
  field :country, :type => String
  field :region, :type => String
  field :year, :type => Integer
  field :bolaget_id, :type => Integer
  field :alcohol_content, :type => Float
  field :organic, :type => Boolean

  fulltext_search_in :name, :description, :producer_name, :country, :region

  def full_name
    "#{name} #{description}"
  end

  def to_s
    full_name
  end

  def alcohol_percent=(percent)
    self.alcohol_content = "6.4%".scanf("%f").first / 100
  end

  def consumers
    User.where('check_ins.beer_id' => id)
  end

  def score
    scores = consumers.map do |consumer|
      consumer.rating_for(self)
    end
    ((scores.sum / scores.size) * 10).round
  end
end
