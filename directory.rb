students = [
	{name: "Me", cohort: :November},
	{name: "James", cohort: :November},
	{name: "Andrey", cohort: :November},
	{name: "Ming the merciless", cohort: :July},
	{name: "Donald Duck", cohort: :July}
]

def pad_to(sample, length)
	to_add = length - sample.size
	if (to_add > 0 )
		sample += " "*to_add
	end
	sample
end

def get_header(title)
	outputArray = []
	title = title.center(80)
	outputArray << title
	outputArray << "=" * title.length
end

def get_names(students, first_letter = nil, max_length = 12)
	if !first_letter.nil?
		students.select!{|student| student[:name].chars.first == first_letter}
	end

	if !max_length.nil?
		students.select!{|student| student[:name].length <= max_length}
	end

	outputArray = []
	students.each_with_index do |student, index|
		outputArray << pad_to("     #{index}. #{student[:name]}", 40) + pad_to("|  (#{student[:cohort]})", 40)
	end
	outputArray
end

def print_footer(names)
	puts "Overall we have #{names.length} great students".center(80)
end

def input_students(cohort)
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

print "Would you like to enter names? (y/n)"

if (gets.chomp == "y")
	students = input_students(:November)
end

outputHeader = get_header("The students of my cohort at Makers Academy")
outputBody = get_names(students)

print (outputHeader.join("\n") + "\n" + outputBody.join("\n") + "\n")

print_footer(students)