class Exam < ActiveRecord::Base
  belongs_to :subject
  has_many :exam_details

  validates :subject_id, presence: true
  validates :name, presence: true
  validates :duration, presence: true, numericality: {only_integer: true}
end
