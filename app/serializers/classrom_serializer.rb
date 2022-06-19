# frozen_string_literal: true

class ClassromSerializer < ActiveModel::Serializer
  attributes :id, :name, :day, :time
  belongs_to :modality
  belongs_to :user
end
