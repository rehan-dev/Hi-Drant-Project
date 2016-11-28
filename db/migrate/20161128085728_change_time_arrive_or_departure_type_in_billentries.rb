class ChangeTimeArriveOrDepartureTypeInBillentries < ActiveRecord::Migration[5.0]
  def change
    change_column :billentries, :time_arrive, :string
    change_column :billentries, :time_departure, :string
  end
end
