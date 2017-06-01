# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :vehicle

  accepts_nested_attributes_for :vehicle
end
