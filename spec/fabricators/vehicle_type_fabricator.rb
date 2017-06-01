Fabricator(:vehicle_type) do
  name { Faker::Lorem.word }
  price { Faker::Commerce.price }
end
