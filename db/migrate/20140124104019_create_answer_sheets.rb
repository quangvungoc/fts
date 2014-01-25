class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.integer :user_id
      t.integer :test_id
      t.text :answers
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end