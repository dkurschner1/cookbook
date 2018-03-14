class Recipe < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  def self.find_all_by_query(query)
    query = query.downcase
    query = "%#{query}%"

    category_id = "%#{category_id}% > option"



    Recipe.where(['lower(title) like ?
                  OR lower(ingredients) like ?
                  OR lower(instructions) like ?
                  OR category_id like ?',
                  query, query, query, category_id])


  end
end
