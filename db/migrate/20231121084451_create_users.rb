class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, limit: 64, null: false, unique: true
      t.string :display_name, limit: 256
      t.string :password_digest, limit: 64, null: false
      t.jsonb :profile_meta

      t.timestamps
    end
  end
end
