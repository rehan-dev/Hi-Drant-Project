class AddUserToBillentry < ActiveRecord::Migration[5.0]
  def change
    add_reference :billentries, :user, foreign_key: true
  end
end
