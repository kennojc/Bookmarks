# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Type.delete_all
Category.delete_all
Bookmark.delete_all

random_boolean = [0, 1]
parent_sample = [rand(1..10), nil]
type_array = ['Paper', 'Photo', 'Video']

20.times do
    Type.create(
        name: type_array.sample
    )
end

20.times do
    Bookmark.create(
        address: "#{Faker::Internet.url}" ,
        category_id: rand(1..10),
        type_id: rand(1..6)
    )
end


20.times do
    Category.create!(
        name: Faker::Hobby.activity,
        public: random_boolean.sample,
        category_id: parent_sample.sample
    )
end










