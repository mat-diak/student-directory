@students = []

# asks user for students' names and creates a hash {name: ..., cohort: ...}
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  # Get the first name
  name = gets.chomp

  while !name.empty? do
    # Add the name as part of hash to students
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # Get a name new
    name = gets.chomp
  end
  @students
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

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

# prints options for interactive menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "-- Incorrect input. Type a number! --"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu