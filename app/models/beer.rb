class Beer
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :producer_name, :type => String
  field :country, :type => String
  field :region, :type => String
  field :year, :type => Integer
  field :bolaget_id, :type => Integer
  field :alcohol_content, :type => Float
  field :organic, :type => Boolean


  def full_name
    "#{name} #{description}"
  end

  def alcohol_percent=(percent)
    self.alcohol_content = "6.4%".scanf("%f").first / 100
  end
end
