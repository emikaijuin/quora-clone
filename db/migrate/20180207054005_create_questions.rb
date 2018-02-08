
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :description
      t.integer :votes
    end
  end
end

