require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = [] # an array of recipe INSTANCES
    load_csv
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  def all
    @recipes
  end

  def find(index)
    return @recipes[index] # returns an INSTANCE
  end

  def remove(index)
    @recipes.delete_at(index)
    save_csv
  end


  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # Title
      csv << ['name', 'description', 'prep_time', 'difficulty', 'done']
      @recipes.each do |recipe|
        # csv << [recipe.name, recipe.description, recipe.prep_time]
        csv << recipe.to_a # translate instance => array of strings
      end
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = (row[:done] == "true")
      @recipes << Recipe.new(row)
    end
  end
end


# what is headers: :first_row, header_converters: :symbol
# row[:done] ?
# what is row ?







