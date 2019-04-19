require_relative("../db/sql_runner")
require_relative("customers")
require_relative("tickets")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = otpions['price'].to_i
  end

  def self.map_items(film_data)
    results = film_data.map { |film| Film.new(film) }
    return results
  end








end
