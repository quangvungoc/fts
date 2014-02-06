class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.string :form
      t.integer :subject_id
      t.integer :duration
      
      t.timestamps
    end
  end
end
