class ChangeQuestionTypeToVc1 < ActiveRecord::Migration
  def change
    change_column :questions, :type, :string, limit: 1
  end
end
