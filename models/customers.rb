require_relative("../db/sql_runner")
require_relative("films")
require_relative("tickets")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(customer_data)
    results = customer_data.map { |customer| Customer.new(customer) }
    return results
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return self.map_items(customers)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end


end
