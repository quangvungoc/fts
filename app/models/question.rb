class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  belongs_to :subject

  validates :subject_id, presence: true
  validates :question_type, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :answers, reject_if: ->attrs { attrs['content'].blank? }, allow_destroy: true
end
