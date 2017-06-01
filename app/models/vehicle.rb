# frozen_string_literal: true

class Vehicle < ApplicationRecord
  TYPES = [[:car, 5], [:truck, 10]].freeze

  belongs_to :vehicle_type
  has_many :sales, dependent: :destroy
end
