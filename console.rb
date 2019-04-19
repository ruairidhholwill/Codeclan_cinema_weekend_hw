require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

require( 'pry-byebug' )

customer1 = Customer.new({ 'name' => 'Lucy', 'funds' => 100 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Connie', 'funds' => 150 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Emily', 'funds' => 200 })
customer3.save()

film1 = Film.new({ 'title' => 'Harry Potter', 'price' => 10 })
film1.save()
film2 = Film.new({ 'title' => 'LOTR', 'price' => 12 })
film2.save()
film3 = Film.new({ 'title' => 'Captain Marvel', 'price' => 8 })
film3.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film1.id })
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film2.id })
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film2.id })
ticket4.save()
ticket5 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film3.id })
ticket5.save()




binding.pry
nil
