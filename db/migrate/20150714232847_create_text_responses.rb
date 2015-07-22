class CreateTextResponses < ActiveRecord::Migration
  def change
    create_table :text_responses do |t|
      t.string :body, null: false
      t.string :message_sid, null: false
      t.string :account_sid, null: false
      t.string :from, null: false

      t.timestamps null: false
    end
  end
end
