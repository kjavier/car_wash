# frozen_string_literal: true

module SaleFormModel
  STEPS = %w[step1 step2].freeze

  class Base 
    include ActiveModel::Model

    attr_accessor :sale, :vehicle

    delegate *Vehicle.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :vehicle
    delegate :with_bed_let_down, to: :sale

    def initialize(attributes)
      @sale = Sale.new(attributes)

      if attributes.blank?
        @sale.build_vehicle
        @vehicle = @sale.vehicle
      else
        @vehicle = process_vehicle(attributes['vehicle_attributes'])
        @sale.vehicle = @vehicle
      end
    end

    def vehicle_type
      @vehicle.vehicle_type
    end

    private

    def process_vehicle(attributes)
      if attributes.present?
        data = Vehicle.find_by_license_plate(attributes['license_plate'])
        
        return data if data.present?
      end

      @sale.vehicle
    end
  end

  class Step1 < Base
    validates_with LicensePlateValidator
    validates :license_plate, presence: true
  end

  class Step2 < Base
    validates_with BedValidator 
    validates :vehicle_type_id, presence: true
  end
end 
