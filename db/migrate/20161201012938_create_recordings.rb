class CreateRecordings < ActiveRecord::Migration[5.0]
  def change
    create_table :recordings do |t|
      t.string :cookie, null: false
      t.string :user_agent
      t.string :label
      t.text :stats
    end
  end
end
