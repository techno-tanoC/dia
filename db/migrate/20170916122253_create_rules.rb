class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :target
      t.string :regex
      t.string :tag

      t.timestamps
    end
  end
end
