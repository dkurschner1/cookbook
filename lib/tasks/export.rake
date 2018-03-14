namespace :db do
  desc "Remove"
  task export_categories: :environment do
    Category.delete 13
    Category.delete 14
    Category.delete 15
    Category.delete 16
    Category.delete 17
    Category.delete 18

    puts "Remove categories."
  end
end
