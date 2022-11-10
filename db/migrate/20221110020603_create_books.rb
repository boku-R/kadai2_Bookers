class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      # タイトルと感想のテーブルを用意
      t.string:title
      t.string:body

      t.timestamps
    end
  end
end
