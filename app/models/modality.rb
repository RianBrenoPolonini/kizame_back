# frozen_string_literal: true

class Modality < ApplicationRecord
  has_many :user, dependent: :nullify
  has_many :classrom, dependent: :destroy

  before_save { name.upcase! }
  validates :name, presence: true
end
