class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_many :responses

  def all_choices
    choices.all
  end
end
