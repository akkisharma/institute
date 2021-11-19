require 'rails_helper'

RSpec.describe Tutor, type: :model do

  describe 'associations' do
    it { should belong_to(:course) }
  end

  describe 'validations' do

    let(:course) { Course.create({name: 'BCA', credits: 100, months_duration: 6}) }

    subject { Tutor.create({course_id: course.id, first_name: 'akash', last_name: 'sharma', email: 'abc@gmail.com', mobile: '1234567890', doj: Date.today}) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:mobile) }
    it { should validate_presence_of(:doj) }
    it { should validate_uniqueness_of(:mobile).case_insensitive }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

end
