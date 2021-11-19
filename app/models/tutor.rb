class Tutor < ApplicationRecord
  # attr_accessor :course_id

  # == Validations
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, uniqueness: true, presence: true, length: { minimum: 10, maximum: 15 }
  validates :doj, presence: true

  # == Associations
  belongs_to :course

end
