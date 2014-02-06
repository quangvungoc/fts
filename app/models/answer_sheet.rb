class AnswerSheet < ActiveRecord::Base
  attr_accessor :subject_id

  belongs_to :user
  belongs_to :exam

  has_many :answer_sheet_details
  has_many :answer_sheet_questions, dependent: :destroy 
  has_many :questions, through: :answer_sheet_questions

  after_create :generate_questions

  private
  def generate_questions
    questions = {}
    subject_id = self.exam.subject.id
    questions = Subject.find(subject_id).questions.group_by{ |q| q.question_type }

    form = self.exam.form
    form.each_char do |t|
      index = Random.rand(questions[t].length)
      AnswerSheetQuestion.create(answer_sheet_id: self.id, question_id: questions[t][index].id)
      questions[t].delete_at(index)
    end
  end
end
