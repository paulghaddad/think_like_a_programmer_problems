require "./student_collection"
require "./student_record"

student_collection = StudentCollection.new
student_4 = StudentRecord.new(grade: 84, id: 1152, name: "Sue")
student_3 = StudentRecord.new(grade: 75, id: 4875, name: "Ed")
student_2 = StudentRecord.new(grade: 98, id: 2938, name: "Todd")
student_1 = StudentRecord.new(grade: 90, id: 1575, name: "Steve")

student_collection.add_record(student_4)
student_collection.add_record(student_3)
student_collection.add_record(student_2)
student_collection.add_record(student_1)

student_collection.remove_record(4875)

puts "\n\nThere are #{student_collection.number_of_records} Student Records:\n"

puts student_collection.all_records

puts "\n\nThe average grade is: #{student_collection.average_grade}%."

puts "\n\nThese students achieved an A:\n"

puts student_collection.records_within_range(low_grade: 90, high_grade: 100)
