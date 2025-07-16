class PaddleClub < ApplicationRecord
  # before_validation :ensure_tier_exists, on: :create

  validates :name, presence: true


  include SweetDate::Tiers
  create_tier from: :name, to: :tier_id


end
