class Quote < ApplicationRecord
  #Validations
  validates :name, presence: true

  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quotes", locals: { quote: self }, target: "quotes" }
  broadcasts_to ->(quotes) { "quotes" }, inserts_by: :prepend

end
