class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.string :title
      t.text :content
      t.string :status, default: 'draft'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
