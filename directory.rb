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
  {name: "Jeb Kerman", cohort: "november"}
  {name: "Norman Bates", cohort: "november"}
]

def header
puts "The students of Villains Academy"
puts "----------------------"
end
def print(names)
names.each {|name| puts "#{name[:name]}, (#{name[:cohort]} cohort)"}
end

def footer(names)
puts "There are #{names.count} students."
end

def input_students
  puts "Please enter the names of students"
  puts "to finish, hit return twice"

  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name ,  cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
students

end
students = input_students
header
print(students)
footer(students)
