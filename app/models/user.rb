# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_save { email.downcase! }

  belongs_to :modality

  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  enum :role, %i[admin teacher student], default: :student
end
