require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )
require_relative( 'models/screenings' )

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screening.delete_all()

def make_customer(name, funds)
  new_customer = Customer.new( { 'name' => name, 'funds' => funds })
  new_customer.save()
  return new_customer
end

customer1 = make_customer('Lucy', 100)
customer2 = make_customer('Connie', 150)
customer3 = make_customer('Emily', 200)
customer4 = make_customer('David', 120)
customer5 = make_customer('Jamie', 190)
customer6 = make_customer('Sam', 300)

def make_film(title, price)
  new_film = Film.new( { 'title' => title, 'price' => price } )
  new_film.save()
  return new_film
end

film1 = make_film('Harry Potter', 10)
film2 = make_film('LOTR', 12)
film3 = make_film('Captain Marvel', 8)

def make_screening(film_id, showing)
  new_screening = Screening.new( { 'film_id' => film_id, 'showing' => showing } )
  new_screening.save()
  return new_screening
end

screening1 = make_screening(film1.id, "15:00")
screening2 = make_screening(film1.id, "18:00")
screening3 = make_screening(film1.id, "21:00")

screening4 = make_screening(film2.id, "16:00")
screening5 = make_screening(film2.id, "19:00")
screening6 = make_screening(film2.id, "22:00")

screening7 = make_screening(film3.id, "13:00")
screening8 = make_screening(film3.id, "19:00")
screening9 = make_screening(film3.id, "21:30")

def make_ticket(customer_id, screening_id, film_id)
  new_ticket = Ticket.new( { 'customer_id' => customer_id, 'screening_id' => screening_id, 'film_id' => film_id } )
  new_ticket.save()
  return new_ticket
end

ticket1 = make_ticket(customer1.id, screening1.id, film1.id)
ticket2 = make_ticket(customer2.id, screening2.id, film1.id)
ticket3 = make_ticket(customer3.id, screening1.id, film1.id)
ticket4 = make_ticket(customer1.id, screening3.id, film1.id)
ticket5 = make_ticket(customer4.id, screening6.id, film2.id)
ticket6 = make_ticket(customer4.id, screening9.id, film3.id)
ticket7 = make_ticket(customer5.id, screening9.id, film3.id)
ticket8 = make_ticket(customer6.id, screening6.id, film2.id)
# customer1.name = 'Pam'
# customer1.update()
#
# customer3.delete()
# film1.delete()




binding.pry
nil
