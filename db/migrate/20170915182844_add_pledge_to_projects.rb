class AddPledgeToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :pledge, :integer
  end
end
