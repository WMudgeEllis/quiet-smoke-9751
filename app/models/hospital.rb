class Hospital < ApplicationRecord
  has_many :doctors

  def uniq_uni
    doctors.pluck(:university).uniq
  end
end
