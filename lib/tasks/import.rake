namespace :db do
  desc "Put default categories in the database"
  task import_categories: :environment do
    Category.create name: "Beverages"
    Category.create name: "Desserts"
    Category.create name: "Appetizers"
    Category.create name: "Entrees"
    Category.create name: "Breakfast"
    Category.create name: "Sandwiches"

    puts "Create categories."
  end
end
