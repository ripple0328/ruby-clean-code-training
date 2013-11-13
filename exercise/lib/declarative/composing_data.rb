class Student
  def initialize(name)
    @name = name
    @score={}
  end

  def assign(subject, score)
    @score[subject.name.downcase] = score
  end

  def subject_score(subject)
    @score[subject.name.downcase]
  end

  def query_score_by_subject_name(subject_name)
    @score[subject_name.downcase]
  end

  def total_score
    @score.values.reduce(:+)
  end
end

class Course
  attr_reader :name
  def initialize(subject)
    @name = subject
  end
end

class Calculator
  def total_average(students)
    students.reduce(0) { |a, e| a + e.total_score } / students.count
  end

  def course_average(students, subject_name)
    students.reduce(0) { |a, e| a + e.query_score_by_subject_name(subject_name.downcase) } / students.count
  end
end
