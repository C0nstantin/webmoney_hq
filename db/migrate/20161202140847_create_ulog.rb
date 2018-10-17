class CreateUlog < ActiveRecord::Migration[5.0]
  def change
    create_table :webmoney_hq_ulogs do |t|
      t.bigint :user_id, null: false
      t.timestamps

    end
  end
end
