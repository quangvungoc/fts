class AnswerSheet < ActiveRecord::Base
  attr_accessor :subject_id

  belongs_to :user
  belongs_to :exam

  has_many :answer_sheet_details
  has_many :answer_sheet_questions, dependent: :destroy 
  has_many :questions, through: :answer_sheet_questions

  after_create :generate_questions, :generate_answer_sheet_details
  before_save :sum_score

  accepts_nested_attributes_for :answer_sheet_details

  private
  def generate_questions
    questions = {}
    subject_id = self.exam.subject.id
    questions = Subject.find(subject_id).questions.group_by{ |q| q.question_type }

    form = self.exam.form
    form.each_char do |t|
      index = Random.rand(questions[t].length)
      AnswerSheetQuestion.create answer_sheet_id: self.id, question_id: questions[t][index].id
      questions[t].delete_at(index)
    end
  end

  def generate_answer_sheet_details
    self.questions.each do |question|
      AnswerSheetDetail.create question_id: question.id, answer_sheet_id: self.id
    end
  end

  def sum_score
    if self.end_time.present? && self.end_time < Time.now
      self.score = self.answer_sheet_details.reduce(0){|sum, details| sum + details.correct}
    end
  end
end
