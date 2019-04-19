require_relative("../db/sql_runner")
require_relative("customers")
require_relative("tickets")

class Film

  attr_accessor :id, :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = otpions['price'].to_i
  end










end
