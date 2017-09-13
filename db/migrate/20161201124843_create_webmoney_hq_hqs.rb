class CreateWebmoneyHqHqs < ActiveRecord::Migration #[5.0]
  def change
    create_table :webmoney_hq_requests do |t|
      t.date    :daterequest
      t.integer :activeuser_daily
      t.integer :activeuser_weekly
      t.integer :activeuser_monthly
      t.timestamps
    end

    create_table :webmoney_hq_items do |t|
      t.date      :daterequest
      t.integer   :count
      t.integer   :operation_id
      t.text      :description
      t.boolean   :istransaction
      t.boolean   :canaggregate
      t.decimal   :amount,    precision: 15, scale: 2
      t.string    :wmcurrency
    end

    add_index :webmoney_hq_requests, :daterequest
    add_index :webmoney_hq_items, :daterequest

  end
end
