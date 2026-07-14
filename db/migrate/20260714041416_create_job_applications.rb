class CreateJobApplications < ActiveRecord::Migration[8.1]
  def change
    create_table :job_applications do |t|
      t.string :position, null: false, default: ""
      t.text :url, null: false, default: ""
      t.date :applied_on, null: false
      t.string :status, null: false, default: "applied"

      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end

    add_index :job_applications, [:user_id, :status] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
    add_index :job_applications, :applied_on
  end
end
