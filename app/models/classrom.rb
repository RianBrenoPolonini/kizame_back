# frozen_string_literal: true

class Classrom < ApplicationRecord
  belongs_to :modality
  belongs_to :user

  before_save { name.upcase! }
  validates :name, presence: true
end
