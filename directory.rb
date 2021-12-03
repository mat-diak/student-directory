@students = []

# prints options for interactive menu
def print_menu
  puts "--- 1. Input the students"
  puts "--- 2. Show the students"
  puts "--- 3. Save the students to students.csv"
  puts "--- 4. Load students list from students.csv"
  puts "--- 9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "!! Incorrect input. Type a number! !!"
  end
end

def add_student(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym} # Create a student_profile hash with values
end

# asks user for students' names and creates a hash {name: ..., cohort: ...}
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp # Get the first name
  while !name.empty? do
    # Add the name as part of hash to students
    add_student(name)
    puts "Now we have #{@students.count} students"
    # Get a name new
    name = STDIN.gets.chomp
  end
  @students
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") # Open the students.csv in read mode
  file.readlines.each { |csv_line| # Loop through lines of students.csv; split each line at ','
    name, cohort = csv_line.split(",")
    add_student(name, cohort)
  }
  file.close # Close file
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

# prints the header
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

# prints students' names
def print_students_list(names)
  names.each { |student_profile|
    puts "#{student_profile[:name]} (#{student_profile[:cohort]} cohort)"
  }
end

# prints the footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def save_students
  #open the csv file
  file = File.open('students.csv', "w")
  #make a loop for each students to be added to the csv file in format 'name,cohort'
  @students.each { |student_profile|
    student_data = [student_profile[:name], student_profile[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  #close file
  file.close
end

def try_load_students
  filename = 'students.csv'
  if filename.nil? then puts "!! File was not loaded !!"; return end
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "#{filename} does not exist."
    exit
  end
end

puts ARGV.join(",")
try_load_students
interactive_menu