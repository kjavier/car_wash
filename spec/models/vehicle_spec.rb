require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  let(:attrs) { Fabricate.attributes_for(:vehicle) }

  subject { described_class.new(attrs) }

  describe 'valid subject' do
    it { expect(subject).to validate_presence_of(:license_plate) }
    it { expect(subject).to validate_presence_of(:vehicle_type_id) }
  end

  describe 'invalid subject' do
    it 'only allows unique license plate' do
      subject_two = Fabricate(:vehicle)

      expect(subject).to_not allow_value(subject_two.license_plate).for(:license_plate)
    end

    it { expect(subject).to_not allow_value('').for(:license_plate) }
    it { expect(subject).to_not allow_value('  ').for(:license_plate) }
    it { expect(subject).to_not allow_value(nil).for(:license_plate) }
    it { expect(subject).to_not allow_value('1111111').for(:license_plate) }
    it { expect(subject).to_not allow_value('').for(:vehicle_type_id) }
    it { expect(subject).to_not allow_value('  ').for(:vehicle_type_id) }
    it { expect(subject).to_not allow_value(nil).for(:vehicle_type_id) }
  end
end
