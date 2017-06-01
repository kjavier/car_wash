# frozen_string_literal: true

class Vehicle < ApplicationRecord
  TYPES = [[:car, 5], [:truck, 10]].freeze

  belongs_to :vehicle_type
  has_many :sales, dependent: :destroy

  validates_with LicensePlateValidator
  validates :license_plate, presence: true, uniqueness: true
  validates :vehicle_type_id, presence: true
end
