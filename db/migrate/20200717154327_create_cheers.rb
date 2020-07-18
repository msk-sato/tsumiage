class CreateCheers < ActiveRecord::Migration[5.2]
  def change
    create_table :cheers do |t|
      t.references :user, foreign_key: true
      t.references :report, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :report_id], unique: true
    end
  end
end
