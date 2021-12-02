# asks user for students' names and creates a hash {name: ..., cohort: ...}
def input_students(students)
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

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

def interactive_menu
  students = []
  loop do
    # print the menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # read the input and save it into a variable
    selection = gets.chomp
    # do what user has asked
    case selection
    when "1"
      students = input_students(students)
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "-- Incorrect input. Type a number! --"
    end
  end
end

interactive_menu