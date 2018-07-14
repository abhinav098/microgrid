class CreateMultiAgentServices < ActiveRecord::Migration[5.1]
  def change
    create_table :multi_agent_services do |t|
      t.integer :consumers_count
      t.integer :prosumers_count
      t.integer :agents_count
      t.integer :total_time_consumed
      t.string  :grid_kind
      t.timestamps
    end
  end
end
