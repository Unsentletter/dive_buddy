class CreateMessenger < ActiveRecord::Migration[5.0]
  def change
    create_table :messengers do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :user, index: true
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
