# frozen_string_literal: true

class Sale < ApplicationRecord
  has_one :vehicle

  accepts_nested_attributes_for :vehicle
end
