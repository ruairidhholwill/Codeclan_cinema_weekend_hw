require_relative("../db/sql_runner")
require_relative("customers")
require_relative("screenings")

class Ticket

  attr_reader :id, :customer_id, :screening_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, screening_id) VALUES ($1, $2) RETURNING id;"
    values = [@customer_id, @screening_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# NOTE: IS THIS NEEDED?
  # def update()
  #   sql = "UPDATE tickets SET ?? = $1 WHERE id = $2"
  #   values = [?? @id]
  #   SqlRunner.run(sql, values)
  # end

  def film()
    sql = "SELECT * FROM screenings WHERE id = $1;"
    values = [@screening_id]
    film = SqlRunner.run(sql, values).first
    return Screening.new(film)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1;"
    values = [@customer_id]
    film = SqlRunner.run(sql, values).first
    return Customer.new(film)
  end

  def self.map_items(ticket_data)
    results = ticket_data.map { |ticket| Ticket.new(ticket) }
    return results
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    return self.map_items(tickets)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end










end
