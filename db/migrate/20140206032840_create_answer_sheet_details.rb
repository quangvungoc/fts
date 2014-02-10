class CreateAnswerSheetDetails < ActiveRecord::Migration
  def change
    create_table :answer_sheet_details do |t|
    	t.integer :answer_sheet_id
    	t.integer :question_id

    	t.text :answer_text
      t.integer :answer_id
      t.integer :correct  
    end

    change_column_default :answer_sheet_details, :correct, 0
  end
end
