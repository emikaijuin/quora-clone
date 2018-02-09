
class UpdateForeignKey < ActiveRecord::Migration[5.0]

  def change
    
    remove_column :answers, :question_id
    
    add_reference :answers, :question, foreign_key: true, foreign_key: :cascade

  end

end

