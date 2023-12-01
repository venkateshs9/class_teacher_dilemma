require_relative 'student'
require_relative 'grade_report'

students = []
File.open('scores_input.txt').readlines.each  do |line|
  data = line.split(',')
  id = data[0]
  scores = {}
  data[1..-1].each do |subject_score|
    subject, score = subject_score.split('-')
    scores[subject] = score.to_i
  end
  students << Student.new(id: id, scores: scores)
end

grade_report = GradeReport.new(students: students)
grade_report.print_score_card
puts "-" * 100
grade_report.print_grade_report
