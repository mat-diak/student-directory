# asks user for students' names and creates a hash {name: ..., cohort: ...}
def input_students
  # Create an empty array to store students
  students = []

  # Methods asks for input
  def ask_for(subject, name)
    yield
    gets.chomp
  end

  # Get the first name
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp

  while !name.empty? do
    # Ask for hobbies
    hobbies = ask_for("hobby", name) {puts "What are #{name}'s hobbies? Separate answers by ,"}
    # Ask for country of birth
    cob = ask_for("country of birth", name) {puts "What is #{name}'s country of birth?"}
    # Ask for height
    height = ask_for("height", name) {puts "What is #{name}'s height?"}
    
    # Add the name as part of hash to students
    students << {
      name: name,
      cohort: :november,
      hobbies: hobbies,
      cob: cob,
      height: height
    }

    # Puts updated count of students
    puts "Now we have #{students.count} students"
    # Get a new name
    name = gets.chomp
  end
  students
end

# prints the header
def print_header
  puts "The students of Villains Academy".center(50)
  puts "---------------".center(50)
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

  print_header

  # Rewrite above each loop into a while loop
  i = 0
  while i < to_print.length
    description = ["#{i + 1}. #{to_print[i][:name]} (#{to_print[i][:cohort]})", "COB: #{to_print[i][:cob]}", "Height: #{to_print[i][:height]}", "Hobbies: #{to_print[i][:hobbies]}"]
    description.each {|line| 
      puts line.center(50)
    }
    i += 1
  end
end

# prints the footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

students = input_students
print(students)
print_footer(students)