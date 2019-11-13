# frozen_string_literal: true

require 'models/application_record'

class Note < ApplicationRecord
  belongs_to :departure

  validates :temperature, :text, presence: true
  validates :temperature, numericality: true
end
