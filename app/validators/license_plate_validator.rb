class LicensePlateValidator < ActiveModel::Validator
  def validate(record)
    if record.license_plate.strip == '1111111'
      record.errors[:license_plate] << 'is stolen! Immediately report to the police!'
    end
  end
end
