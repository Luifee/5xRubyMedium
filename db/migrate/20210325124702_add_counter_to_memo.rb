class AddCounterToMemo < ActiveRecord::Migration[6.1]
  def change
    add_column :memos, :clap, :integer, default: 0
  end
end
