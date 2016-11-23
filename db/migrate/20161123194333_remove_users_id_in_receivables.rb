class RemoveUsersIdInReceivables < ActiveRecord::Migration[5.0]
  def change
    remove_column :receivables, :users_id
  end
end
