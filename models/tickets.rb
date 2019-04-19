require_relative("../db/sql_runner")
require_relative("customers")
require_relative("films")

class Ticket

  attr_accessor :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = otpions['film_id'].to_i
  end










end
