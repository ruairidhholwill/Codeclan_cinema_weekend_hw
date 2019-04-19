require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )
require_relative( 'models/screenings' )

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screening.delete_all()

customer1 = Customer.new({ 'name' => 'Lucy', 'funds' => 100 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Connie', 'funds' => 150 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Emily', 'funds' => 200 })
customer3.save()
customer4 = Customer.new({ 'name' => 'David', 'funds' => 120 })
customer4.save()
customer5 = Customer.new({ 'name' => 'Jamie', 'funds' => 190 })
customer5.save()
customer6 = Customer.new({ 'name' => 'Sam', 'funds' => 300 })
customer6.save()

film1 = Film.new({ 'title' => 'Harry Potter', 'price' => 10 })
film1.save()
film2 = Film.new({ 'title' => 'LOTR', 'price' => 12 })
film2.save()
film3 = Film.new({ 'title' => 'Captain Marvel', 'price' => 8 })
film3.save()

screening1 = Screening.new({ 'film_id' => film1.id, 'showing' => "15:00" } )
screening1.save()
screening2 = Screening.new({ 'film_id' => film1.id, 'showing' => "18:00" } )
screening2.save()
screening3 = Screening.new({ 'film_id' => film1.id, 'showing' => "21:00" } )
screening3.save()

screening4 = Screening.new({ 'film_id' => film2.id, 'showing' => "16:00" } )
screening4.save()
screening5 = Screening.new({ 'film_id' => film2.id, 'showing' => "19:00" } )
screening5.save()
screening6 = Screening.new({ 'film_id' => film2.id, 'showing' => "22:00" } )
screening6.save()

screening7 = Screening.new({ 'film_id' => film3.id, 'showing' => "13:00" } )
screening7.save()
screening8 = Screening.new({ 'film_id' => film3.id, 'showing' => "19:00" } )
screening8.save()
screening9 = Screening.new({ 'film_id' => film3.id, 'showing' => "21:30" } )
screening9.save()


ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'screening_id' => screening1.id, 'film_id' => film1.id })
ticket1.save()

ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'screening_id' => screening2.id, 'film_id' => film1.id })
ticket2.save()

ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'screening_id' => screening1.id, 'film_id' => film1.id })
ticket3.save()

ticket4 = Ticket.new({ 'customer_id' => customer1.id, 'screening_id' => screening3.id, 'film_id' => film1.id })
ticket4.save()

ticket5 = Ticket.new({ 'customer_id' => customer4.id, 'screening_id' => screening5.id, 'film_id' => film2.id })
ticket5.save()

ticket6 = Ticket.new({ 'customer_id' => customer4.id, 'screening_id' => screening9.id, 'film_id' => film3.id })
ticket6.save()

ticket7 = Ticket.new({ 'customer_id' => customer5.id, 'screening_id' => screening7.id, 'film_id' => film3.id })
ticket7.save()

ticket8 = Ticket.new({ 'customer_id' => customer6.id, 'screening_id' => screening6.id, 'film_id' => film2.id })
ticket8.save()

# customer1.name = 'Pam'
# customer1.update()
#
# customer3.delete()
# film1.delete()




binding.pry
nil
