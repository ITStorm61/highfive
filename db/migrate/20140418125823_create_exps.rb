class CreateExps < ActiveRecord::Migration
  def change
    create_table :exps do |t|
      t.integer :user_id1
      t.integer :user_id2
      t.integer :value

      t.timestamps
    end
  end
end
