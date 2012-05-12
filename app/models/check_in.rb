class CheckIn
  include Mongoid::Document
  embedded_in :user

  belongs_to :beer

  field :rating, type: Integer
end
