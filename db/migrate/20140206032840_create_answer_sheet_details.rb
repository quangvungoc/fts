class CreateAnswerSheetDetails < ActiveRecord::Migration
  def change
    create_table :answer_sheet_details do |t|
    	t.integer :answer_sheet_id
    	t.integer :question_id

    	t.text :answer
    end
  end
end
