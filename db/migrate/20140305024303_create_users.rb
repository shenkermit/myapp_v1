class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ename
      t.string :cname
      t.string :email
      t.string :password_digest
      t.integer :branch_id
      t.integer :role_id, default: '2'

      t.timestamps
    end
  end
end
