class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :twitter_id
      t.string :access_token
      t.string :access_verifier

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
