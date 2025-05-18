# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




courses = [{:name=>"appetizer"},{:name=> "main course/entree"}, {:name=>"dessert"}, {:name=>"soup"},{:name=> "salad"}]

if courses.nil?
  courses.each do|c_data|
    the_course = Course.new
    the_course.name=c_data.fetch(:name)
    the_course.save
  end
end


cuisines = [{:name=>"Italian"},{:name=> "Indian"}, {:name=>"Chinese"}, {:name=>"Mexican"},{:name=> "Mediterranean"},{:name=> "Thai"},{:name=> "Others"}]

if cusines.nil?
  cuisines.each do|c_data|
    the_cuisine = Cuisine.new
    the_cuisine.name=c_data.fetch(:name)
    the_cuisine.save
  end
end
