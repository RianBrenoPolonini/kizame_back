# frozen_string_literal: true

class Modality < ApplicationRecord
  before_save { name.upcase! }
  validates :name, presence: true
end
