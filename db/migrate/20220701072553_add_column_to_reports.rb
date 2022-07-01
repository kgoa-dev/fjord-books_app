class AddColumnToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :user_id, :string
  end
end
