class ProjectBodyChangeText < ActiveRecord::Migration[5.0]
  def change
    change_column(:projects, :body, :text)
  end

  def down
    change_column :projects, :body, :string
  end
end
