class CreateTrendtweets < ActiveRecord::Migration
  def change
    create_table :trendtweets do |t|
      t.string :trend
      t.string :tweet

      t.timestamps
    end
  end
end
