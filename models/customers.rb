require_relative("../db/sql_runner")
require_relative("films")
require_relative("tickets")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = otpions['fund'].to_i
  end

  def self.map_items(customer_data)
    results = customer_data.map { |customer| Customer.new(customer) }
    return results
  end






end
