class CreateActors < ActiveRecord::Migration[8.1]
  def change
    create_table :actors do |t|
      t.string "actor_name"
      t.integer "agent_id"

      t.timestamps
    end
  end
end