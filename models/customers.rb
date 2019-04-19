require_relative("../db/sql_runner")
require_relative("films")
require_relative("tickets")

class Customer

  attr_accessor :id, :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = otpions['fund'].to_i
  end








end
