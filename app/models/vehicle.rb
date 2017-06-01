# frozen_string_literal: true

class Vehicle < ApplicationRecord
  TYPES = %w[car truck].freeze

  belongs_to :sale
end
