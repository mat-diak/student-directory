# asks user for students' names and creates a hash {name: ..., cohort: ...}
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  
  # Create an empty array to store students
  students = []

  # Get the first name
  name = gets.chomp

  while !name.empty? do
    # Add the name as part of hash to students
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get a name new
    name = gets.chomp
  end
  students
end


# prints the header
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

# prints students' names
def print(names)
  names.each { |student_profile|
    puts "#{student_profile[:name]} (#{student_profile[:cohort]} cohort)"
  }
end

# prints the footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)