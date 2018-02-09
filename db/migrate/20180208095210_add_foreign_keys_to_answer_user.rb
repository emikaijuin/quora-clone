
class AddForeignKeysToAnswerUser < ActiveRecord::Migration[5.0]

  def change

    add_reference :answer_users, :user, foreign_key: true
    add_reference :answer_users, :answer, foreign_key: true
    
  end

end

