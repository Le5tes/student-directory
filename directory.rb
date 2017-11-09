@students = [
  {name: "Dr. Hannibal Lecter", cohort: "november"},
  {name: "Darth Vader", cohort: "november"},
  {name: "Nurse Ratched", cohort: "november"},
  {name: "Michael Corleone", cohort: "november"},
  {name: "Lucien LaChance", cohort: "november"},
  {name: "Alex DeLarge", cohort: "november"},
  {name: "The Wicked Witch of the West", cohort: "november"},
  {name: "Terminator", cohort: "november"},
  {name: "The Joker", cohort: "november"},
  {name: "Freddy Kruger", cohort: "november"},
  {name: "Jeoffrey Baratheon", cohort: "november"},
  {name: "Jeb Kerman", cohort: "november"},
  {name: "Norman Bates", cohort: "november"}
]
@cohort = :november
def header
  puts ""
  puts "The students of Villains Academy"
  puts "----------------------"
end

def print_student_list(names)
  names.each_with_index {|name, i| puts "#{i + 1}: #{name[:name]}, (#{name[:cohort]} cohort)"}
end

def footer(students)
puts "There are #{students.count} students."
end

def input_students
  puts "Please enter the names of students"
  puts "to finish, hit return twice"

  students = []
  name = STDIN.gets.chomp
  while !name.empty? do
    students << {name: name ,  cohort: @cohort}
    puts "Now we have #{students.count} student#{"s" unless students.count == 1}."
    name = STDIN.gets.chomp
  end
  students

end

def add_student
  puts "Please enter the name of the student."
  name = STDIN.gets.chomp
  puts "#{name} added (#{@cohort} cohort)."
  {name:name, cohort: @cohort}
end

def display_students
  header
  print_student_list(@students)
  footer(@students)
end

def get_cohort
  puts "Please Enter the cohort"
  cohort = STDIN.gets.chomp.downcase.to_sym
end

def clear
  puts "Clear all students? (YES/NO)"
  check = STDIN.gets.chomp
  if check.upcase == "YES"
    @students = []
    puts "Students cleared."
  else
    puts "Aborting, students retained."
  end
end

def process selection
  case selection.upcase
  when "INPUT STUDENTS"
    @students = input_students
  when "DISPLAY STUDENTS"
    display_students
  when "ADD STUDENT"
    @students << add_student
  when "CHANGE COHORT"
    @cohort = get_cohort
  when "CLEAR STUDENTS"
    clear
  when "SAVE STUDENTS"
    save_students
  when "LOAD STUDENTS"
    load_students
  when "HELP"
    help_menu
  when "EXIT"
    exit
  end
end
def help_menu
  puts "Commands:\nDISPLAY STUDENTS\nINPUT STUDENTS\nADD STUDENT\nCHANGE COHORT\nSAVE STUDENTS\nLOAD STUDENTS\nCLEAR STUDENTS\nHELP\nEXIT"
  puts "Commands aren't case sensitive. Unrecognised commands are ignored."
end

def greeting
  puts "Welcome to the student directory for Villains Academy!"
end

def prompt
  puts ""
  puts "What would you like to do?"
  puts "Type 'HELP' for commands, 'EXIT' to end program."
end

def interface
  greeting
  loop do
    prompt
    process STDIN.gets.chomp
  end
end

def save_students
  file = File.open "student_directory.csv", "w"
  @students.each do |student|
    student_data = [student[:name],[student[:cohort]]]
    file.puts (student_data.join(","))
  end
  file.close
end

def load_students (filename = "student_directory.csv")
  file = File.open(filename ,"r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split (',')
    @students << {name:name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students filename
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry no such file (#{filename})."
    exit
  end
end

try_load_students
interface
