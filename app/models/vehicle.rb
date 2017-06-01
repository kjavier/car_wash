# frozen_string_literal: true

class Vehicle < ApplicationRecord
  TYPES = [[:car, 5], [:truck, 10]].freeze

  has_many :sales
end
