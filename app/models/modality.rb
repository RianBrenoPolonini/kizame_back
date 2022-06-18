# frozen_string_literal: true

class Modality < ApplicationRecord
  has_many :user, dependent: :nullify

  before_save { name.upcase! }
  validates :name, presence: true
end
