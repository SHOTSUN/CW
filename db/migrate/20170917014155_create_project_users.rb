class CreateProjectUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_users do |t|
      t.references :project
      t.references :user
      t.timestamps :user
    end
  end
end
