class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :content
      t.integer :correct_answer
    end

    change_column_default :answers, :correct_answer, 0
  end
end
