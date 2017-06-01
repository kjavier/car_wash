# frozen_string_literal: true

class Sale < ApplicationRecord
  paginates_per 10

  belongs_to :vehicle

  accepts_nested_attributes_for :vehicle
  
  delegate :license_plate, :vehicle_type, to: :vehicle 
end
