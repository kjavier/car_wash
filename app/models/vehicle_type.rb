# frozen_string_literal: true

class VehicleType < ApplicationRecord
  has_many :vehicles

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }
end
