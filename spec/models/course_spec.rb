require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'associations' do
    it { should have_many(:tutors) }
  end

  describe 'validations' do

    subject { Course.create({name: 'BCA', credits: 100, months_duration: 6})  }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:credits) }
    it { should validate_presence_of(:months_duration) }
    it { should accept_nested_attributes_for(:tutors) }
    it { should validate_uniqueness_of(:name).case_insensitive }

  end

end
