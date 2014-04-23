class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :trendName
      t.integer :trendCounts

      t.timestamps
    end
  end
end
