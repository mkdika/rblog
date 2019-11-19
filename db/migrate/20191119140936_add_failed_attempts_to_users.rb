class AddFailedAttemptsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :failed_attempts, :integer
  end
end
