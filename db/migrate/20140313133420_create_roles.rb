class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.string :role_cname
      t.string :role_content

      t.timestamps
    end
  end
end
