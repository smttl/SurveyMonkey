class CreateQuestions < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.references :survey

      t.timestamps
    end
  end
end
