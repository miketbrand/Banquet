class CreateAggregates < ActiveRecord::Migration
  def change
    create_table :aggregates do |t|
      t.string :aggType
      t.string :aggStatus
      t.timestamps
    end
  end
end
