students = [
	{name: "Me", cohort: :November},
	{name: "James", cohort: :November},
	{name: "Andrey", cohort: :November},
	{name: "Ming the merciless", cohort: :July},
	{name: "Donald Duck", cohort: :July}
]

def interactive_menu
	loop do
		# 1. print the menu and ask the user what to do
		puts "1. Input the students"
		puts "2. Show the students"
		puts "9. Exit"
		# 2. read the input and save it into a variable
		selection = gets.chomp
		# 3. do what the user has asked
		case selection
		when "1"
			# input the students
			students = input_students
		when "2"
			# show the students
		when "9"
			exit
		else
			puts "I don't know what you meant, try again"
		end
		# 4. repeat from step 1
	end
end

def input_students(cohort = :January)
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	students = []

	name = gets.chomp

	while !name.empty? do
		students << {:name => name, cohort: cohort}
		puts "Now we have #{students.length} students"

		name = gets.chomp
	end
	students
end

def print_header(title, width=80)
	puts title.center(width)
	puts "=" * width
end

def print_names(students, first_letter = nil, max_length = 12)
	if !first_letter.nil?
		students.select!{|student| student[:name].chars.first == first_letter}
	end

	if !max_length.nil?
		students.select!{|student| student[:name].length <= max_length}
	end

	students.each_with_index do |student, index|
		puts "     #{index}. #{student[:name]}".ljust(40) + "|  (#{student[:cohort]})".ljust(40)
	end
end
print_header("Student Cohort")
print_names(students)