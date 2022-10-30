# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding'
User.create!([
               {
                 "first_name": 'Koni',
                 "last_name": 'Bobi',
                 "email_address": 'datazamp6@gmail.com',
                 "phone_number": '0737423431',
                 "username": 'apo',
                 "password_digest": 'boilerplate5554'
               },
               {
                 "first_name": 'Faka',
                 "last_name": 'Tobi',
                 "email_address": 'datagam@gmail.com',
                 "phone_number": '0733466577',
                 "username": 'redo',
                 "password_digest": 'boilerplate99944'
               },
               {
                 "first_name": 'Drey ',
                 "last_name": 'Mwangi',
                 "email_address": 'mandem@gmail.com',
                 "phone_number": '0734662575',
                 "username": 'preme',
                 "password_digest": 'boilerplate9933'
               },
               {
                 "first_name": 'Brian',
                 "last_name": 'Kimtai',
                 "email_address": 'prpm@gmail.com',
                 "phone_number": '0721466577',
                 "username": 'prrred',
                 "password_digest": 'boilerplatet644'
               },
               {
                 "first_name": 'Grace',
                 "last_name": 'Mish',
                 "email_address": 'deezer@gmail.com',
                 "phone_number": '0712436577',
                 "username": 'skrrr',
                 "password_digest": 'boilerplate45944'
               }

             ])
