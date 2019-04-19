require_relative("../db/sql_runner")
require_relative("films")
require_relative("tickets")
require_relative("customers")

class Screening

  attr_reader :id, :film_id
  attr_accessor :showing

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @showing = options['showing']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, showing) VALUES ($1, $2) RETURNING id;"
    values = [@film_id, @showing]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE screenings SET showing = $1 WHERE id = $2"
    values = [@showing, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(screening_data)
    results = screening_data.map { |screening| Screening.new(screening) }
    return results
  end

  def self.all()
    sql = "SELECT * FROM screenings;"
    screenings = SqlRunner.run(sql)
    return self.map_items(screenings)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql)
  end






end
