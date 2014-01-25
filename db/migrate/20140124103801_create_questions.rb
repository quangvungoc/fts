class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.string :type
      t.text :content
      t.string :answer

      t.timestamps
    end
  end
end
