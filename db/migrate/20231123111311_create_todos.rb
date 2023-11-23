class CreateTodos < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    create_table :todos, id: :uuid do |t|
      t.string :title, limit: 128, null: false
      t.text :description, limit: 10240
      t.references :user, null: false, foreign_key: true, index: { algorithm: :concurrently }, type: :uuid
      t.jsonb :tags

      t.timestamps
    end
  end
end
