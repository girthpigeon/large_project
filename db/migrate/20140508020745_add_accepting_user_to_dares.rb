class AddAcceptingUserToDares < ActiveRecord::Migration
  def change
    add_column :dares, :accepting_user, :user
  end
end
