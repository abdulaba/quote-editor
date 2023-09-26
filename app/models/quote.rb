class Quote < ApplicationRecord
  #Validations
  validates :name, presence: true
end
