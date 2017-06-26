require "./student_collection"
require "./student_record"
require 'pry'

student_collection = StudentCollection.new
student_3 = StudentRecord.new(grade: 84, id: 1152, name: "Sue")
student_2 = StudentRecord.new(grade: 75, id: 4875, name: "Ed")
student_1 = StudentRecord.new(grade: 98, id: 2938, name: "Todd")

student_collection.add_record(student_3)
student_collection.add_record(student_2)
student_collection.add_record(student_1)

binding.pry
student_collection.remove_record(4875)
