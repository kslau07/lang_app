# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'guest', password: 'password')
guest = User.find_by("email = ?", "guest")
User.create(email: 'test_user', password: 'password')

Category.create(name: "Prepositions", user_id: 1)
Question.create(ques_content: "Tu devrais reconnaître le petit garçon près ___ je me suis assis.", correct_answer: "duquel", category_id: 1, user_id: 1)
Question.create(ques_content: "Les amis loin ___ nous vivons restent chers à nos cœurs.", correct_answer: "desquels", category_id: 1, user_id: 2)
Question.create(ques_content: "C'est une pièce à propos de ___ nous avons longuement discuté.", correct_answer: "laquelle", category_id: 1, user_id: 2)

Category.create(name: "Aller", user_id: 2)
Question.create(ques_content: "Où ___-tu ?", correct_answer: "vas", translation: "Where are you going?", category_id: 2, user_id: 1)
Question.create(ques_content: "Je ___ à l’école.", correct_answer: "vais", translation: "I’m going to school.", category_id: 2, user_id: 2)
Question.create(ques_content: "Il ___ y aller avec toi.", correct_answer: "veut", translation: "He wants to go with you.", category_id: 2, user_id: 2)

puts "#{User.all.count} user record(s)"
puts "#{Category.all.count} category record(s)"
puts "#{Question.all.count} question record(s)"