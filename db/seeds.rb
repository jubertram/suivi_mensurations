# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Phase.destroy_all

phase = Phase.create!(
  user_id: 6,
  phase_type: 'perte de poids',
  started_date: Date.today,
  period: 90
)

measure1 = Measurement.create!(
  phase_id: phase.id,
  date: '2023-03-20',
  weight: 84,
  bras: 37,
  poitrine: 105,
  taille: 89,
  hanches: 97,
  cuisses: 64
)

measure2 = Measurement.create!(
  phase_id: phase.id,
  date: '2023-04-03',
  weight: 83,
  bras: 37.5,
  poitrine: 101,
  taille: 88,
  hanches: 97,
  cuisses: 65
)
