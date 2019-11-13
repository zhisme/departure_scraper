# frozen_string_literal: true

require 'models/application_record'

class Departure < ApplicationRecord
  has_one :note

  validates :city, :flight, :time, presence: true
end
