class CreateResponses < ActiveRecord::Migration

  def change
    create_table :responses do |t|
      t.string :title
      t.references :user
      t.references :choice
      t.references :question
      t.references :survey

      t.timestamps
    end
  end
end