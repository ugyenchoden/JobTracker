class CreateApplications < ActiveRecord::Migration[8.1]
  def change
    create_table :applications do |t|
      t.string :position, null: false, default: ""
      t.text :url, null: false, default: ""
      t.date :applied_on, null: false
      t.string :status, null: false, default: "applied"

      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end

    add_index :applications, [:user_id, :status] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
    add_index :applications, :applied_on
  end
end
