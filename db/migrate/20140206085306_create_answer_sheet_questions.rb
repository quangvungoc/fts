class CreaeAnswerSheetQuestions < ActiveRecord::Migration
  def change
    create_table :answer_sheet_questions do |t|
      t.integer :answer_sheet_id
      t.integer :question_id

      t.timestamps
    end
    add_index :answer_sheet_questions, :answer_sheet_id
    add_index :answer_sheet_questions, [:answer_sheet_id, :question_id], unique: true, name: "asq_index"
  end
end
