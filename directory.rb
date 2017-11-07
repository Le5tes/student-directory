students = [
  ["Dr. Hannibal Lecter", "november"],
  ["Darth Vader","november"],
  ["Nurse Ratched","november"],
  ["Michael Corleone","november"],
  ["Lucien LaChance","november"],
  ["Alex DeLarge","november"],
  ["The Wicked Witch of the West","november"],
  ["Terminator","november"],
  ["The Joker","november"],
  ["Freddy Kruger","november"],
  ["Jeoffrey Baratheon","november"],
  ["Norman Bates","november"]
]

def header
puts "The students of Villains Academy"
puts "----------------------"
end
def print(names)
names.each {|name| puts "#{name[0]}, (#{name[1]} cohort)
end

def footer(names)
puts "There are #{names.count} students."
end

header
print(students)
footer(students)
