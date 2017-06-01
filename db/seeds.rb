# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless VehicleType.any?
  [{ name: 'Car', price: 5 }, { name: 'Truck', price: 10 }].each do |data|
    VehicleType.create!(data)
  end
end

unless Vehicle.any?
  Vehicle.create!(license_plate: 'xyz111', vehicle_type: VehicleType.first)
  Vehicle.create!(license_plate: 'abc222', vehicle_type: VehicleType.first)
  Vehicle.create!(license_plate: 'def334', vehicle_type: VehicleType.last)
  Vehicle.create!(license_plate: 'fsh995', vehicle_type: VehicleType.last)
end

unless Sale.any?
  Sale.create!(vehicle: Vehicle.first, has_mud_on_bed: true, with_bed_let_down: true)
  Sale.create!(vehicle: Vehicle.first, has_mud_on_bed: true, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.first, has_mud_on_bed: false, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.first, has_mud_on_bed: false, with_bed_let_down: true)
  Sale.create!(vehicle: Vehicle.second, has_mud_on_bed: true, with_bed_let_down: true)
  Sale.create!(vehicle: Vehicle.second, has_mud_on_bed: true, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.second, has_mud_on_bed: false, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.second, has_mud_on_bed: false, with_bed_let_down: true)
  Sale.create!(vehicle: Vehicle.third, has_mud_on_bed: true, with_bed_let_down: true)
  Sale.create!(vehicle: Vehicle.third, has_mud_on_bed: true, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.third, has_mud_on_bed: false, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.third, has_mud_on_bed: false, with_bed_let_down: true)
  Sale.create!(vehicle: Vehicle.fourth, has_mud_on_bed: true, with_bed_let_down: true)
  Sale.create!(vehicle: Vehicle.fourth, has_mud_on_bed: true, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.fourth, has_mud_on_bed: false, with_bed_let_down: false)
  Sale.create!(vehicle: Vehicle.fourth, has_mud_on_bed: false, with_bed_let_down: true)
end
