class Quote < ActiveRecord::Base
  validates :text,
    presence: true

  validates :author,
    presence: true
end
