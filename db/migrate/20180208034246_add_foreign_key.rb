
class AddForeignKey < ActiveRecord::Migration

  def change
  
  add_reference :answers, :question, foreign_key: true
  add_reference :questions, :user, foreign_key: true
  
  end

end

