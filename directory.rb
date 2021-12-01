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
    # Get a new name
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
def print(student_profiles)
  # Create a printing array
  to_print = student_profiles
  
  # Asks if user wants to print only names starting with a specific character
  puts "To print names only beginning with a character, type character"
  puts "To print all names press return"
  character = gets.chomp

  # Modify to_print to contain only names with specific character
  if character != ""
    to_print.delete_if {|student_profile| student_profile[:name][0].upcase != character.upcase}
  end

  # Modify to_print to contain only names 12 characters long
  to_print.delete_if {|student_profile| student_profile[:name].length >= 12}

  to_print.each_with_index { |student_profile, index|
      puts "#{index + 1}. #{student_profile[:name]} (#{student_profile[:cohort]} cohort)"
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