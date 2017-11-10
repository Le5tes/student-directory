def input_students
  puts "Please enter the names of the students".center(40)
  puts "To finish, just hit return twice".center(40)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the cohort for #{name}"
    cohort = gets.chomp
    cohort = "november" if cohort.empty?
    cohort = cohort.to_sym
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students".center(40)
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print(students)
  a = 0
  until a == students.length
    puts "#{a+1}. #{students[a][:name]} (#{students[a][:cohort]} cohort)".center(40)
    a += 1
  end
end

def add_hobbies (students)
  students.each{|student|
    puts "Please enter a hobby for #{student[:name]}".center(40)
    student[:hobby] = gets.chomp
  }
end

def print_hobbies (students)
    students.each{|student|
      puts "#{student[:name]} likes #{student[:hobby]}.".center(40)
    }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
add_hobbies(students)
print_hobbies(students)
