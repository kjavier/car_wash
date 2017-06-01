# frozen_string_literal: true

module SaleFormModel
  STEPS = %w[step1 step2].freeze

  class Base 
    include ActiveModel::Model

    attr_accessor :sale, :vehicle

    delegate *Vehicle.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :vehicle

    def initialize(attributes)
     @sale = Sale.new(attributes)
     @sale.build_vehicle if attributes.blank?
     @vehicle = @sale.vehicle
     pr attributes.inspect
     pr @vehicle.inspect
    end

    def vehicle_attributes=(attributes)
      @vehicle.attributes.map do |name, value| 
        @vehicle.send("#{name}=", value)
      end
    end
  end

  class Step1 < Base
    validates :license_plate, presence: true
  end
end 
