class AnswerSheetQuestion < ActiveRecord::Base
  belongs_to :question
  validates :answer_sheet_id, presence: true
  validates :question_id, presence: true
end
