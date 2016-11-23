class ChangeUsersToUserInReceivables < ActiveRecord::Migration[5.0]
  def change
    # remove foreign key
    remove_foreign_key :receivables, :users
    # change to below after remove column
    add_reference :receivables, :user, foreign_key: true
  end
end
