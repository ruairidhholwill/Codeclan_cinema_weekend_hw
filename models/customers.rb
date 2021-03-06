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

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    INNER JOIN customers
    ON tickets.customer_id = customers.id
    WHERE customer_id = $1;"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    Film.map_items(customers)
  end

  def get_film_price()
    sql = "SELECT price FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    INNER JOIN customers
    ON tickets.customer_id = customers.id
    WHERE customer_id = $1;"
    values = [@id]
    price_hash = SqlRunner.run(sql, values)
    prices_array = price_hash.map { |price| price['price'].to_i  }
    price = prices_array.sum
    return price
  end

  def buy_ticket()
    new_funds = @funds - get_film_price()
    return new_funds
  end

  def num_of_tickets_bought
    sql = "SELECT title FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    INNER JOIN customers
    ON tickets.customer_id = customers.id
    WHERE customer_id = $1;"
    values = [@id]
    film_hash = SqlRunner.run(sql, values)
    films_array = film_hash.map { |film| film['title'] }
    num_tickets = films_array.count
    return num_tickets
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
