class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :age
      t.datetime :created_at
      t.datetime :update_at
      t.string :surname
      t.string :email
      t.string :id_face
      t.timestamps
    end

  end
end
