require_relative("../db/sql_runner")
require_relative("customers")
require_relative("tickets")
require_relative("screenings")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET title = $1, price = $2 WHERE id = $3;"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    INNER JOIN films
    ON tickets.film_id = films.id
    WHERE film_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    Customer.map_items(films)
  end

  def num_of_customers()
    sql = "SELECT name FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    INNER JOIN films
    ON tickets.film_id = films.id
    WHERE film_id = $1;"
    values = [@id]
    customer_hash = SqlRunner.run(sql, values)
    customers = customer_hash.map { |customer| customer['name'] }
    num_of_customers = customers.count
    return num_of_customers
  end

  def self.map_items(film_data)
    results = film_data.map { |film| Film.new(film) }
    return results
  end

  def self.all()
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    return self.map_items(films)
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end







end
