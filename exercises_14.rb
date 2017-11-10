require 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save Students to file"
  puts "4. Load Students to file"
  puts "9. Exit" # 9 because we'll be adding more items
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
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students (file_prompt)
  when "4"
    try_load_students (file_prompt)
  else
    puts "I don't know what you meant, try again"
  end
end

def file_prompt
  puts "Enter a file name. (Default 'students.csv')"
  gets.chomp
end

def add_student name, cohort
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students filename
filename = "students.csv" if filename.nil? or filename == ""

  if File.exist?(filename)
    puts "#{filename} already exists. Overwrite? (y/n)"
    return if gets.chomp != "y"
  end
  # open the file for writing
  CSV.open(filename, "w"){|file|
  # iterate over the array of students
    @students.each do |student|
      file << [student[:name], student[:cohort]]      
    end
  }
  puts "Saved."
end

def load_students(filename)
  CSV.foreach(filename, "r"){ |line|
      name, cohort = line
      add_student name, cohort.to_sym
  }
end

def try_load_students filename
  filename = "students.csv" if filename.nil? or filename == ""
    if File.exist?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
  end
end

def load_on_open
  filename = ARGV.first# first argument from the command line
  try_load_students filename
end

load_on_open
interactive_menu
