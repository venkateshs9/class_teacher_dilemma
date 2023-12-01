class Student
  GRADE_A = 'A'.freeze
  GRADE_B = 'B'.freeze
  GRADE_C = 'C'.freeze
  ABOVE_AVERAGE = 'ABOVE'.freeze
  BELOW_AVERAGE = 'BELOW'.freeze

  attr_reader :id, :scores, :total, :grade

  def initialize(id:, scores:)
    @id = id
    @scores = scores
    @total = calculate_total
    @grade = find_grade
  end

  def calculate_total
    scores.values.sum
  end

  def find_grade
    case total
    when 340...Float::INFINITY then GRADE_A
    when 300..340 then GRADE_B
    else GRADE_C
    end
  end

  def grade_average(students_in_grade)
    students_in_grade.map(&:total).sum / students_in_grade.length
  end

  def average_compare(students_in_grade)
    return ABOVE_AVERAGE if total >= grade_average(students_in_grade)

    BELOW_AVERAGE
  end
end
