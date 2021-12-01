# puts all students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Fredd Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]

# print students' names
puts "The students of Villains Academy"
puts "---------------"
students.each { |student|
  puts student
}

# prints the total number of students
puts "Overall, we have #{students.count} great students"