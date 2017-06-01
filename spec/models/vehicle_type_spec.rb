require 'rails_helper'

RSpec.describe VehicleType, type: :model do
  let(:attrs) { Fabricate.attributes_for(:vehicle_type) }

  subject { described_class.new(attrs) }

  describe 'valid subject' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_numericality_of(:price) }
  end

  describe 'invalid subject' do
    it 'only allows unique name' do
      subject_two = Fabricate(:vehicle_type)

      expect(subject).to_not allow_value(subject_two.name).for(:name)
    end

    it { expect(subject).to_not allow_value('').for(:name) }
    it { expect(subject).to_not allow_value('  ').for(:name) }
    it { expect(subject).to_not allow_value(nil).for(:name) }
    it { expect(subject).to_not allow_value('').for(:price) }
    it { expect(subject).to_not allow_value('  ').for(:price) }
    it { expect(subject).to_not allow_value(nil).for(:price) }
    it { expect(subject).to_not allow_value(-1).for(:price) }
    it { expect(subject).to_not allow_value(0).for(:price) }
  end
end
