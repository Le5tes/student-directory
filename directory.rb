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
  name = gets.chomp
  while !name.empty? do
    students << {name: name ,  cohort: @cohort}
    puts "Now we have #{students.count} student#{"s" unless students.count == 1}."
    name = gets.chomp
  end
students

end

def add_student
  puts "Please enter the name of the student."
  name = gets.chomp
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
  cohort = gets.chomp.downcase.to_sym
end

def clear
  puts "Clear all students? (YES/NO)"
  check = gets.chomp
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
  when "HELP"
    puts "Commands:\nDISPLAY STUDENTS\nINPUT STUDENTS\nADD STUDENT\nCHANGE COHORT\nCLEAR STUDENTS\nHELP\nEXIT"
    puts "Commands aren't case sensitive. Unrecognised commands are ignored."
  when "EXIT"
    exit
  end
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
    process gets.chomp
  end
end

interface
