class Search < ActiveRecord::Base
  def recipes
    @recipes ||= find_recipes
  end

  def find_recipes
    Recipe.find(:all, :conditions => conditions)
  end

  def keyword_conditions
    ["recipes.title LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end

  def category_conditions
    ["recipes.category_id = ?", category_id] unless category_id.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map {|condition| condition[1..-1]}.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end
