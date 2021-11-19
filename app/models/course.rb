class Course < ApplicationRecord

  # == Validations
  validates :name,uniqueness: {case_sensitive: false}, presence: true
  validates :credits, numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :months_duration, numericality: {greater_than_or_equal_to: 1}, presence: true

  # == Associations
  has_many :tutors, dependent: :destroy

  # == Scopes
  scope :courses_with_tutors, -> { joins("LEFT JOIN tutors ON tutors.course_id = courses.id").select('courses.name as course_name, courses.credits, courses.months_duration, tutors.*') }

  accepts_nested_attributes_for :tutors
end
