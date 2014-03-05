class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branch_code
      t.string :branch_name

      t.timestamps
    end

    add_index :branches, :branch_code, unique: true
  end
end
