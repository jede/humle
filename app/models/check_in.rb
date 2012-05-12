class CheckIn
  include Mongoid::Document
  embedded_in :user

  belongs_to :beer
  belongs_to :place

  field :rating, type: Integer
  field :comment, type: String
end
