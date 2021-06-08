# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create(username:"Mrs.Science", email: "teacher1@email.com", password: "science")

Life = Course.create(name: "Life Science", description:"The Study of Living Organisms", teacher_id: 1)
Physical = Course.create(name: "Physical Science", description:"The Study of Matter and Energy", teacher_id: 1)
Algebra =Course.create(name: "Algebra", description:"Algebra is the study of mathematical symbols and the rules for manipulating these symbols", teacher_id: 2)


Student.create(first_name: "Selim", last_name: "Sessiz", grade_level:7, gender: "male", birthday: 12.years.ago, teacher_id:1) #1
Student.create(first_name: "Pelin", last_name: "Bora", grade_level:7, gender: "female",birthday: 12.years.ago + 1.month , teacher_id:1) #2
Student.create(first_name: "Ahmet", last_name: "Acik", grade_level:7, gender: "male", birthday: 12.years.ago + 3.months + 1.day, teacher_id:1, )   #3
Student.create(first_name: "Deniz", last_name: "Dolu", grade_level:7, gender: "male",birthday: 12.years.ago - 2.months + 1.day, teacher_id:1)   #4
Student.create(first_name: "Derya", last_name: "Adanali", grade_level:7, gender: "female", birthday: 12.years.ago + 1.month + 10.days, teacher_id:1)  #5
Student.create(first_name: "Ayse", last_name: "Bakar", grade_level:7, gender: "female", birthday: 12.years.ago + 4.months + 1.day, teacher_id:1)  #6
Student.create(first_name: "Seda", last_name: "Ak", grade_level:7, gender: "female", birthday: 12.years.ago + 5.months + 1.day, teacher_id:1)   #7
Student.create(first_name: "Ali", last_name: "Kayak", grade_level:7, gender: "male",birthday: 12.years.ago + 4.months + 11.days, teacher_id:1)   #8
Student.create(first_name: "Mert", last_name: "Sari", grade_level:7, gender: "male",birthday: 12.years.ago + 2.months + 12.days, teacher_id:1)   #9
Student.create(first_name: "Eda", last_name: "Pak", grade_level:7, gender: "female",birthday: 12.years.ago + 3.months + 9.days, teacher_id:1)   #10


Student.create(first_name: "Alin", last_name: "Ay", grade_level:8, gender: "male", birthday: 13.years.ago + 1.month + 1.day, teacher_id:1)    #11-15
Student.create(first_name: "Naz", last_name: "Veli", grade_level:8, gender: "female", birthday: 13.years.ago + 2.months + 1.day, teacher_id:1)
Student.create(first_name: "Cenk", last_name: "Toprak", grade_level:8, gender: "male", birthday: 13.years.ago + 3.months + 1.day, teacher_id:1)
Student.create(first_name: "Emre", last_name: "Erkek", grade_level:8, gender: "male", birthday: 13.years.ago + 3.months + 1.day, teacher_id:1)
Student.create(first_name: "Azra", last_name: "Bayan", grade_level:8, gender: "female", birthday: 13.years.ago + 3.months + 1.day, teacher_id:1)














