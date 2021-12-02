@students = []

# asks user for students' names and creates a hash {name: ..., cohort: ...}
def input_students(students)
  # Methods asks for input
  def ask_for(subject, name)
    yield 
    input = gets.chomp
    input == "" ? input = "unknown" : input
  end

  # Check if month
  def check_if_month(name)
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    months.map{ |month| month.upcase }.include? name.upcase
  end


  # Get the first name
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp

  # If name give, ask for more details
  while !name.empty? do
    # Ask for cohort
    cohort = ask_for("cohort", name) {puts "Which cohort is #{name} in?"}
    until check_if_month(cohort)
      cohort = ask_for("cohort", name) {puts "Incorrect input. Type in month"}
    end
    # Ask for hobbies
    hobbies = ask_for("hobby", name) {puts "What are #{name}'s hobbies? Separate answers by ,"}
    # Ask for country of birth
    cob = ask_for("country of birth", name) {puts "What is #{name}'s country of birth?"}
    # Ask for height
    height = ask_for("height", name) {puts "What is #{name}'s height?"}
    
    # Add the name as part of hash to students
    students << {
      name: name,
      cohort: cohort.to_sym,
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
def print_students_list(student_profiles)
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
  print_footer(student_profiles)
end

# prints cohorts
def print_cohort(students_profiles, which_cohort)
  # Select students who match the cohort
  selection = students_profiles.select { |student_profile| student_profile[:cohort] == which_cohort.to_sym }
  puts "#{which_cohort} cohort members:"
  selection.each { |student_profile|
    puts "#{student_profile[:name]}"
  }
end

# prints the footer
def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(50)
  else
    puts "Overall, we have #{names.count} great students".center(50)
  end
end

def print_option(students)
  if students.length == 0
    puts "There are no students on the list."
  else
    while true do
      puts "Type 'all' to see all students or type 'cohort' to see a cohort list"
      puts "type 'stop' to end"
      input = gets.chomp
      if input == "stop"
        break
      elsif input == "cohort"
        puts "Which cohort to print?"
        cohort_to_print = gets.chomp
        print_cohort(students, cohort_to_print.to_sym)
      elsif input == "all"
        print_students_list(students)
      else
        puts "Spelling mistake or cohort does not exist."
      end
    end
  end
end

def print_menu
  # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    students = input_students(@students)
  when "2"
    print_option(@students)
  when "9"
    exit
  else
    puts "-- Incorrect input. Try again --"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end  
end

def run_script
  interactive_menu
end

run_script