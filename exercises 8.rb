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
    cohort = "tba"
    while (month_order cohort) == 13
      cohort = gets.chomp
      cohort = "november" if cohort.empty?
      cohort = cohort.downcase.to_sym
    end
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} student#{"s" if students.count != 1}".center(40)
    # get another name from the user
    name = gets.chop
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def month_order month
  case month
  when :january then 1
  when :february then 2
  when :march then 3
  when :april then 4
  when :may then 5
  when :june then 6
  when :july then 7
  when :august then 8
  when :september then 9
  when :october then 10
  when :november then 11
  when :december then 12
  else 13
  end
end

def print(students)
  a = 0
  students.sort! {|a,b|month_order(a[:cohort])<=>month_order(b[:cohort]) }
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
  puts "Overall, we have #{students.count} great student#{"s" if students.count != 1}".center(40)
end

students = input_students
#nothing happens until we call the methods
print_header
if students.count > 0 then print(students) else puts "There are no students here :(".center(40) end
print_footer(students)
add_hobbies(students)
print_hobbies(students)
