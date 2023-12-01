class GradeReport
  GRADE_A = 'A'.freeze
  GRADE_B = 'B'.freeze
  GRADE_C = 'C'.freeze

  attr_reader :students

  def initialize(students:)
    @students = students
  end

  def print_score_card
    puts "Score card"
    puts "id Subject1 Subject2 Subject3 Subject4 Grand-Total Grade Average-Compare"
    students.each do |student|
       puts "#{student.id}\t#{student.scores.values.join("\t")}\t#{student.total}\t#{student.grade}\t#{student.average_compare(students_in_grade(student.grade))}"
    end
  end

  def students_in_grade(grade)
    students.select { |student| student.grade == grade }
  end

  def students_above_average
    students.select { |student| student.total > student.grade_average(students_in_grade(student.grade)) }
  end

  def students_below_average
    students.select { |student| student.total < student.grade_average(students_in_grade(student.grade)) }
  end

  def print_grade_report
    puts "Grade report"
    puts "Number of students in A Grade :: #{students_in_grade(GRADE_A).length}"
    puts "Number of students in B Grade :: #{students_in_grade(GRADE_B).length}"
    puts "Number of students in C Grade :: #{students_in_grade(GRADE_C).length}"
    puts "Number of students above their grade average :: #{students_above_average.length}"
    puts "Number of students below their grade average :: #{students_below_average.length}"
  end
end
