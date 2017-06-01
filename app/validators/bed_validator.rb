# frozen_string_literal: true

class BedValidator< ActiveModel::Validator
  def validate(record)
    if record.with_bed_let_down && record.vehicle_type.name == Sale::TRUCK 
      record.errors['Truck'] << 'cannot be serviced.'
    end
  end
end
