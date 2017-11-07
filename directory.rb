students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Lucien LaChance",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "The Joker",
  "Freddy Kruger",
  "Jeoffrey Baratheon",
  "Norman Bates"
]

def header
puts "The students of Villains Academy"
puts "----------------------"
end
def print(names)
names.each {|name| puts name}
end

def footer(names)
puts "There are #{names.count} students."
end

header
print(students)
footer(students)
