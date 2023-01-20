class CreateInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :interactions do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
