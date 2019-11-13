# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :temperature, null: false
      t.string :text, null: false
      t.belongs_to :departure

      t.timestamps
    end
  end
end
