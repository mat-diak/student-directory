# puts all students in an array
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Fredd Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
  ]

# Create a method for printing the header
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

# Create a method for printing students' names
def print(names)
  names.each { |student|
    puts student
  }
end

# Create a method for printing the footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)