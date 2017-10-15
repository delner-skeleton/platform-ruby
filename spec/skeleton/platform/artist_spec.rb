require 'spec_helper'

RSpec.describe Skeleton::Platform::Artist do
  describe 'class' do
    subject { described_class }

    describe 'behavior' do
      describe '#initialize' do
        context 'given all required arguments' do
          subject do
            super().new(
              name: name,
              album_ids: album_ids
            )
          end

          let(:name) { 'The Dark Side of the Moon' }
          let(:album_ids) { ['THE_DARK_SIDE_OF_THE_MOON'] }

          context 'then the returned object' do
            it { is_expected.to be_a_kind_of(described_class) }

            describe '#id' do
              subject { super().id }
              it { is_expected.to be nil }
            end

            describe '#name' do
              subject { super().name }
              it { is_expected.to eq(name) }
            end

            describe '#album_ids' do
              subject { super().album_ids }
              it { is_expected.to eq(album_ids) }
            end
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
