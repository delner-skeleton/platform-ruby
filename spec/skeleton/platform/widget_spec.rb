require 'spec_helper'

RSpec.describe Skeleton::Platform::Widget do
  describe 'class' do
    subject { described_class }

    describe '#initialize' do
      context 'given no arguments' do
        subject { super().new }

        context 'then the returned object' do
          it { is_expected.to be_a_kind_of(described_class) }

          describe '#color' do
            subject { super().color }
            it { is_expected.to eq('blue') }
          end
        end
      end

      context 'given a color' do
        subject { super().new(color: color) }
        let(:color) { 'red' }

        context 'then the returned object' do
          it { is_expected.to be_a_kind_of(described_class) }

          describe '#color' do
            subject { super().color }
            it { is_expected.to eq(color) }
          end
        end
      end
    end
  end

  describe 'instance' do
    subject { instance }
    let(:instance) { described_class.new }
  end
end
