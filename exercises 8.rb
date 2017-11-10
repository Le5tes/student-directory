def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  a = 0
  until a == students.length
    puts "#{a+1}. #{students[a][:name]} (#{students[a][:cohort]} cohort)"
    a += 1
  end
end

def add_hobbies (students)
  students.each{|student|
    puts "Please enter a hobby for #{student[:name]}"
    student[:hobby] = gets.chomp
  }
end

def print_hobbies (students)
    students.each{|student|
      puts "#{student[:name]} likes #{student[:hobby]}."
    }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
add_hobbies(students)
print_hobbies(students)
