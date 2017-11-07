students = [
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
cohort = :november
def header
puts "The students of Villains Academy"
puts "----------------------"
end
def print(names)
names.each_with_index {|name, i| puts "#{i + 1}: #{name[:name]}, (#{name[:cohort]} cohort)"}
end

def footer(names)
puts "There are #{names.count} students."
end

def input_students cohort
  puts "Please enter the names of students"
  puts "to finish, hit return twice"

  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name ,  cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
students

end

def add_student cohort
  puts "Please enter the name of the student."
  name = gets.chomp
  puts "#{name} added (#{cohort} cohort)."
  {name:name, cohort: cohort}
end

#main loop
puts "Welcome to the student directory for Villains Academy!"
puts "What would you like to do?"
puts "Type 'HELP' for commands, 'EXIT' to end program."
input = gets.chomp
while input.upcase != "EXIT"
  case input.upcase
  when "INPUT STUDENTS"
    students = input_students cohort
  when "DISPLAY STUDENTS"
    header
    print(students)
    footer(students)
  when "ADD STUDENT"
    students << add_student(cohort)
  when "CHANGE COHORT"
    puts "Please Enter the cohort"
    cohort = gets.chomp.downcase.to_sym
    puts "Cohort set to #{cohort}."
  when "CLEAR STUDENTS"
    puts "Clear all students? (YES/NO)"
    check = gets.chomp
    if check.upcase == "YES"
      students = []
      puts "Students cleared."
    else
      puts "Aborting, students retained."
    end
  when "HELP"
    puts "Commands:\nDISPLAY STUDENTS\nINPUT STUDENTS\nADD STUDENT\nCHANGE COHORT\nCLEAR STUDENTS\nHELP\nEXIT"
    puts "Commands aren't case sensitive. Unrecognised commands are ignored."
  end
  puts ""
  puts "What would you like to do?"
  puts "Type 'HELP' for commands, 'EXIT' to end program."
  input = gets.chomp

end
