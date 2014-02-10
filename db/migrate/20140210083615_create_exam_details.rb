class CreateExamDetails < ActiveRecord::Migration
  def change
    create_table :exam_details do |t|
      t.integer :exam_id
      t.string :question_type

      t.timestamps
    end
  end
end
