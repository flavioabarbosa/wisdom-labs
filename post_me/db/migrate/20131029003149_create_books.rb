class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :update_at
      t.string :id_book
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
