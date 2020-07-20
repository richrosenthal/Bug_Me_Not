class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
