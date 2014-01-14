@students = [
	{name: "Me", cohort: :November},
	{name: "James", cohort: :November},
	{name: "Andrey", cohort: :November},
	{name: "Ming the merciless", cohort: :July},
	{name: "Donald Duck", cohort: :July}
]

def interactive_menu
	#students = []
	loop do
		# 1. print the menu and ask the user what to do
		print_menu
		# 2. read the input and save it into a variable
		selection = gets.chomp
		# 3. do what the user has asked
		case selection
		when "1"
			# input the students
			input_students
		when "2"
			# show the students
			show_students
		when "9"
			exit
		else
			puts "I don't know what you meant, try again"
		end
		# 4. repeat from step 1
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "9. Exit"
end

def input_students(cohort = :January)
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	#students = []

	name = gets.chomp

	while !name.empty? do
		@students << {:name => name, cohort: cohort}
		puts "Now we have #{@students.length} students"

		name = gets.chomp
	end
end

def show_students
	print_header("The Students of Makers Academy")
	print_names
	print_footer
end

def print_header(title, width=80)
	puts title.center(width)
	puts "=" * width
end

def print_names(first_letter = nil, max_length = 12)
	if !first_letter.nil?
		@students.select!{|student| student[:name].chars.first == first_letter}
	end

	if !max_length.nil?
		@students.select!{|student| student[:name].length <= max_length}
	end

	@students.each_with_index do |student, index|
		puts "     #{index+1}. #{student[:name]}".ljust(40) + "|  (#{student[:cohort]})".ljust(40)
	end
end

def print_footer(width=80)
	puts "-"*width
	puts "Overall we have #{@students.length} great students".center(80)
end
interactive_menu