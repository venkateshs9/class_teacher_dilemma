RSpec.describe GradeReport do
  describe 'with students' do
    let(:score_1) { {'S1' => 88, 'S2' => 53, 'S3' => 69, 'S4' => 64} }
    let(:score_2) { {'S1' => 88, 'S2' => 83, 'S3' => 69, 'S4' => 69} }
    let(:score_3) { {'S1' => 88, 'S2' => 63, 'S3' => 69, 'S4' => 50} }
    let(:student_1) { Student.new(id: '1', scores: score_1) }
    let(:student_2) { Student.new(id: '2', scores: score_2) }
    let(:student_3) { Student.new(id: '3', scores: score_3) }
    let(:students) { [student_1, student_2, student_3] }
    let(:grade_report) { GradeReport.new(students: students) }

    context 'with students in grade' do
      let(:grade) { Student::GRADE_B }
      let(:expected) { students.select { |student| student.grade == grade } }

      it 'return grade b students count' do
        expect(grade_report.students_in_grade(grade)).to eq(expected)
      end
    end

    context 'with students above average in grade' do
      let(:expected) { students.select { |student| student.total > student.grade_average(students_in_grade(student.grade)) } }

      it 'should return only above average students in grade' do
        expect(grade_report.students_above_average).to include(student_1)
      end

      it 'should not return below average students in grade' do
        expect(grade_report.students_above_average).not_to include(student_2, student_3)
      end

      it 'return students count of above average in grade' do
         expect(grade_report.students_above_average.length).to eq 1
      end
    end

    context 'with students below average in grade' do
      let(:expected) { students.select { |student| student.total < student.grade_average(students_in_grade(student.grade)) } }

      it 'should return only below average students in grade' do
        expect(grade_report.students_below_average).to include(student_3)
      end

      it 'should not return above average students in grade' do
        expect(grade_report.students_below_average).not_to include(student_1, student_2)
      end

      it 'return students count of below average in grade' do
         expect(grade_report.students_below_average.length).to eq 1
      end
    end
  end
end
