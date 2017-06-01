Fabricator(:vehicle) do
  license_plate { Faker::Lorem.word }
  vehicle_type
end
