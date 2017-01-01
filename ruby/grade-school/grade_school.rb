# - Add a student's name to the roster for a grade
#   - "Add Jim to grade 2."
#   - "OK."
# - Get a list of all students enrolled in a grade
#   - "Which students are in grade 2?"
#   - "We've only got Jim just now."
# - Get a sorted list of all students in all grades.  Grades should sort
#   as 1, 2, 3, etc., and students within a grade should be sorted
#   alphabetically by name.
#   - "Who all is enrolled in school right now?"
#   - "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe.
#     Grade 3...

# Note that all our students only have one name.  (It's a small town, what
# do you want?)

# ## For bonus points

# Did you get the tests passing and the code clean? If you want to, these
# are some additional things you could try:

# - If you're working in a language with mutable data structures and your
#   implementation allows outside code to mutate the school's internal DB
#   directly, see if you can prevent this. Feel free to introduce additional
#   tests

module BookKeeping
  VERSION = 3
end

class School
  def initialize
    @grades = {}
  end

  def add(name, grade)
    @grades[grade] = Grade.new(grade) unless @grades[grade]
    @grades[grade].add(name)
  end

  def students(grade)
    @grades[grade] ? @grades[grade].students : []
  end

  def students_by_grade
    @grades.keys.sort.map do |i|
      @grades[i].data
    end
  end
end

class Grade
  def initialize(grade)
    @grade = grade
    @students = []
  end

  def add(name)
    @students.push(name) unless @students.include?(name)
  end

  def students
    @students.sort
  end

  def data
    {
      grade: @grade,
      students: students
    }
  end
end
