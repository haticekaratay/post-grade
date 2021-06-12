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
Algebra =Course.create(name: "Algebra", description:"Algebra is the study of mathematical symbols and the rules for manipulating these symbols", teacher_id: 1)


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

(1..10).each do |i|
    StudentCourse.create(student_id:"#{i}", course_id:1, prerequisite: false)
end 

StudentCourse.create(student_id:11, course_id:3, prerequisite: true)
StudentCourse.create(student_id:12, course_id:3, prerequisite: true)
StudentCourse.create(student_id:13, course_id:3, prerequisite: true)

StudentCourse.create(student_id:11, course_id:2, prerequisite: false)
StudentCourse.create(student_id:12, course_id:2, prerequisite: false)
StudentCourse.create(student_id:13, course_id:2, prerequisite: false)
StudentCourse.create(student_id:14, course_id:2, prerequisite: false)
StudentCourse.create(student_id:15, course_id:2, prerequisite: false)
Assignment.create(name:"Plant Cells Quiz", description:"Measures students learning on Plant Cells, Multiple choice.", due_date: 7.days.after, max: 20, assignment_type: "Quiz", course_id: 1)
Assignment.create(name:"Plant Cells Lab Questions", description:"Complete the follow up questions on the lab package", due_date: 4.days.after, max: 20, assignment_type:"Homework" , course_id: 1)
Assignment.create(name:"What you know about plants", description:"Measures students prior knowledge about plants.Students get a completion grade on this assignment", due_date: 10.days.ago, max: 10, assignment_type:"Classwork", course_id: 1)
Assignment.create(name:"Onion Cells Lab", description:" Complete the lab questions on the package", due_date: 1.days.after, max: 10, assignment_type:"Classwork", course_id: 1)

Assignment.create(name:"Inertia quiz", description:"Measures students learning on Newtons First Law of Motion, Multiple choice.", due_date: 7.days.after, max: 20, assignment_type:"Quiz" , course_id: 2)
Assignment.create(name:"Inertia Lab Questions", description:"Complete the follow up questions on the lab package", due_date: 4.days.after, max: 20, assignment_type:"Homework"  , course_id: 2)
Assignment.create(name:"What you know about inertia", description:"Measures students prior knowledge Newton's first law.Students get a completion grade on this assignment", due_date: 10.days.ago, max: 10, assignment_type:"Classwork" , course_id: 2)
Assignment.create(name:"Mouse Car Built", description:" Built a car solely powered by a mouse trap", due_date: 1.days.after, max: 10 ,assignment_type:"Classwork" , course_id: 2)

Assignment.create(name:"Solving Equations Quiz", description:"Measures students learning on Solving Equations, Multiple choice.", due_date: 7.days.after, max: 20, assignment_type:"Quiz",course_id: 3)
Assignment.create(name:"Solving inequalities Questions", description:"Complete the follow up questions on the package", due_date: 4.days.after, max: 20, assignment_type:"Homework" ,course_id: 3)
Assignment.create(name:"What you know about inequalities", description:"Measures students prior knowledge .Students get a completion grade on this assignment", due_date: 10.days.ago, max: 10, assignment_type:"Classwork",course_id: 3)
Assignment.create(name:"Solving Equations test", description:" Unit Test", due_date: 1.days.after, max: 100, assignment_type:"Exam",course_id: 3)

(1..10).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:1, grade: 10+i)
end 

(1..10).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:2, grade: 20 - i )
end 

(1..5).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:3 , grade: 5 + i)
end

(6..10).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:3, grade: i, is_applicable?: false)
end 

(1..10).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:4, grade: 10)
end 


(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:5 , grade: 20)
end 

(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:6, grade: 18)
end

(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:7, grade: 10)
end
(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:8, grade: 9)
end
(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:9, grade: 20)
end

(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:10 ,grade: 18)
end

(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:11, grade: 9)
end

(11..15).each do |i|
    StudentAssignment.create(student_id:"#{i}", assignment_id:12, grade: 80 + 2* i)
end













