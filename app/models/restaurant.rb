class Restaurant < ApplicationRecord
    belongs_to :city, optional: true
  end
