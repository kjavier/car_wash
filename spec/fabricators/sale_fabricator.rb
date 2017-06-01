Fabricator(:sale) do
  amount { Faker::Commerce.price }
  has_mud_on_bed { %w(true false) }
  with_bed_let_down { %w(true false) }
  vehicle
end
