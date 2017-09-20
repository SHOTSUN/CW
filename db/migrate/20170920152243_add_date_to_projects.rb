class AddDateToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :lastDate, :datetime
  end
end
