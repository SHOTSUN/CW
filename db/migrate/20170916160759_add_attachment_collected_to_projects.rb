class AddAttachmentCollectedToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :collected, :integer, default: 0, null: false
  end
end
