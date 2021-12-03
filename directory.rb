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
    puts "++ student input mode ++"
    @students = input_students_mode
  when "2"
    puts "++ showing students ++"
    show_students
  when "3"
    save_students(ask_for_filename {puts "--- Type filename to save the list to. ---"})
    puts "++ saved ++"
  when "4"
    load_students(ask_for_filename {puts "--- Type filename from which to import names. ---"})
    puts "++ loaded ++"
  when "9"
    puts "++ exiting ++"
    exit
  else
    puts "!! Incorrect input. Type a number! !!"
  end
end

def add_student(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym} # Create a student_profile hash with values
end

def print_intro
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
end

def get_name
  name = STDIN.gets.chomp # Get a name new
end

# asks user for students' names and creates a hash {name: ..., cohort: ...}
def input_students_mode
  print_intro
  name = get_name
  while !name.empty? do
    add_student(name) # Add the name as part of hash to students
    puts "Now we have #{@students.count} students"
    name = get_name
  end
  @students
end

def load_file(filename)
    file_lines = File.open(filename, "r") { |file| file.readlines}
    file_lines.each { |csv_line| name, cohort = csv_line.split(","); add_student(name, cohort) }
end

def resolve_list_conflict
  while true do 
    puts "Do you wanna overwrite the current list? Y/N"
    choice = STDIN.gets.chomp
    break if choice.upcase == "Y" || choice.upcase == "N"
  end
  choice
end

def load_students(filename = "students.csv")
  if @students.empty? # Check if @students is empty
    load_file(filename)
  else
    choice = resolve_list_conflict
    if choice.upcase == "Y"
      @students = []
      load_file(filename)
    elsif choice == "N"
      puts "++ List was not loaded. ++"
      return
    end
  end
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

def save_students(filename = 'students.csv')
  #open the csv file
  file = File.open(filename, "w")
  #make a loop for each students to be added to the csv file in format 'name,cohort'
  @students.each { |student_profile|
    student_data = [student_profile[:name], student_profile[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  #close file
  file.close
end

def ask_for_filename
  yield
  filename = STDIN.gets.chomp
end

def try_load_students(filename = 'students.csv')
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Auto-loading failed"
    return
  end
end

try_load_students
interactive_menu