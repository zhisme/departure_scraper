# frozen_string_literal: true

class CreateDepartures < ActiveRecord::Migration[5.2]
  def change
    create_table :departures do |t|
      t.string :city, null: false
      t.string :flight, null: false
      t.string :time, null: false

      t.timestamps
    end

    add_index :departures, %i[city flight]
  end
end
