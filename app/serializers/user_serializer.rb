# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  belongs_to :modality

  attributes :id, :first_name, :last_name, :email, :role
end
