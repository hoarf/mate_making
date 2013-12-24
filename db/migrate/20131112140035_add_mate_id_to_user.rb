class AddMateIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :mate_id, :integer
  end
end
