RSpec.describe Student do
  describe 'with student scores' do
    let(:student_data) { ['1', 'S1-88', 'S2-53', 'S3-69', 'S4-64'] }
    let(:id) { student_data[0] }
    let(:scores) { {'S1' => 88, 'S2' => 53, 'S3' => 69, 'S4' => 64} }
    let(:student) { Student.new(id: id, scores: scores) }

    it 'returns id' do
      expect(student.id).to eq(id)
    end

    it 'returns student grade' do
      expect(student.grade).to eq Student::GRADE_C
    end

    context 'with total score' do
      let(:expected) { scores.values.sum }

      it 'returns student total score' do
        expect(student.total).to eq(expected)
      end
    end

    context 'with grade average' do
      let(:grade) { Student::GRADE_C }
      let(:score_1) { {'S1' => 88, 'S2' => 53, 'S3' => 69, 'S4' => 64} }
      let(:score_2) { {'S1' => 88, 'S2' => 83, 'S3' => 69, 'S4' => 69} }
      let(:score_3) { {'S1' => 88, 'S2' => 63, 'S3' => 69, 'S4' => 50} }
      let(:student_1) { Student.new(id: '1', scores: score_1) }
      let(:student_2) { Student.new(id: '2', scores: score_2) }
      let(:student_3) { Student.new(id: '3', scores: score_3) }
      let(:all_students) { [student_1, student_2, student_3] }
      let(:grade_students) { all_students.select { |student| student.grade == grade } }
      let(:expected) { (student_1.total + student_3.total) / 2 }

      it 'returns grade average' do
        expect(student.grade_average(grade_students)).to eq(expected)
      end
    end

    context 'with average compare' do
      let(:grade) { Student::GRADE_C }
      let(:score_1) { {'S1' => 88, 'S2' => 53, 'S3' => 69, 'S4' => 64} }
      let(:score_2) { {'S1' => 88, 'S2' => 83, 'S3' => 69, 'S4' => 69} }
      let(:score_3) { {'S1' => 88, 'S2' => 63, 'S3' => 69, 'S4' => 50} }
      let(:student_1) { Student.new(id: '1', scores: score_1) }
      let(:student_2) { Student.new(id: '2', scores: score_2) }
      let(:student_3) { Student.new(id: '3', scores: score_3) }
      let(:all_students) { [student_1, student_2, student_3] }
      let(:grade_students) { all_students.select { |student| student.grade == grade } }

      it 'returns grade average' do
        expect(student.average_compare(grade_students)).to eq(Student::ABOVE_AVERAGE)
      end
    end
  end
end
