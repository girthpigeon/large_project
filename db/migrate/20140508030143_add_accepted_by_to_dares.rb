class AddAcceptedByToDares < ActiveRecord::Migration
  def change
    add_column :dares, :accepted_by, :integer
  end
end
