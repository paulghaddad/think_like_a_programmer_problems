require_relative "../lib/student_node"
require_relative "../lib/student_record"

describe StudentNode do
  describe "#initialize" do
    it "has student_data and next attributes" do
      student_1 = StudentRecord.new(grade: 90, id: 1575, name: "Steve")

      student_node = StudentNode.new(student_1)

      expect(student_node.student_data).to eq(student_1)
      expect(student_node.next).to be nil
    end
  end

  describe "#next" do
    it "points to another student node" do
      student_1 = StudentRecord.new(grade: 90, id: 1575, name: "Steve")
      student_2 = StudentRecord.new(grade: 100, id: 1576, name: "Bob")
      student_node_1 = StudentNode.new(student_1)
      student_node_2 = StudentNode.new(student_2)

      student_node_1.next = student_node_2

      expect(student_node_1.next).to eq(student_node_2)
    end
  end
end
