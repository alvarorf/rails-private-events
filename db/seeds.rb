# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
event_attributes = [{name: "", date: DateTime.now.strftime("%d/%m/%Y"), location: "",
                    description: ""},
                    {name: "", date: DateTime.now.strftime("%d/%m/%Y"), location: "",
                    description: ""},
                    {name: "", date: DateTime.now.strftime("%d/%m/%Y"), location: "",
                    description: ""},
                    {name: "", date: DateTime.now.strftime("%d/%m/%Y"), location: "",
                    description: ""},
                    {name: "", date: DateTime.now.strftime("%d/%m/%Y"), location: "",
                    description: ""},
                    {name: "", date: DateTime.now.strftime("%d/%m/%Y"), location: "",
                    description: ""},]

User.create! [{name: "Mike", username: "mike123", email: "mike@example.com", password: "password123"},
                   {name: "Rose", username: "rose123", email: "rose@example.com", password: "password123"},
                   {name: "Peter", username: "peter123", email: "peter@example.com", password: "password123"},
                   {name: "James", username: "jay123", email: "jay@example.com", password: "password123"},
                   {name: "Chloe", username: "chloe123", email: "chloe@example.com", password: "password123"}
                  ]

#user_attributes.each { |name, username, email, password|
 # User.create( name: name, username: username, email: email, password: password)
#}
