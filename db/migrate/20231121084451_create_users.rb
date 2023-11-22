class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, limit: 64, null: false, unique: true
      t.string :display_name, limit: 256, null: false, index: true
      t.string :password_digest, limit: 64, null: false
      t.jsonb :profile

      t.timestamps
    end
  end
end


# user = User.create(email: 'tg@example.com', display_name: 'tg', password: 'wow', profile: { gender: 1 })