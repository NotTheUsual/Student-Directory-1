students = [
	{name: "Me", cohort: :November},
	{name: "James", cohort: :November},
	{name: "Andrey", cohort: :November},
	{name: "Ming the merciless", cohort: :July},
	{name: "Donald Duck", cohort: :July}
]

def print_header
	puts "The students of my cohort at Makers Academy \n
	-----------"
end

def print_names(names)
	names.each do |student|
		puts "#{student[:name]} (#{student[:cohort]})"
	end
end

def print_footer(names)
	puts "Overall we have #{names.length} great students"
end\



print_header()
print_names(students)
print_footer(students)