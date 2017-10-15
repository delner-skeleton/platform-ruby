require 'spec_helper'

RSpec.describe Skeleton::Platform::Album do
  describe 'class' do
    subject { described_class }

    describe 'behavior' do
      describe '#initialize' do
        context 'given all required arguments' do
          subject do
            super().new(
              title: title,
              artist_ids: artist_ids,
              release_date: release_date
            )
          end

          let(:title) { 'The Dark Side of the Moon' }
          let(:artist_ids) { ['PINK_FLOYD'] }
          let(:release_date) { Date.new(1973, 3, 1) }

          context 'then the returned object' do
            it { is_expected.to be_a_kind_of(described_class) }

            describe '#id' do
              subject { super().id }
              it { is_expected.to be nil }
            end

            describe '#title' do
              subject { super().title }
              it { is_expected.to eq(title) }
            end

            describe '#artist_ids' do
              subject { super().artist_ids }
              it { is_expected.to eq(artist_ids) }
            end

            describe '#release_date' do
              subject { super().release_date }
              it { is_expected.to eq(release_date) }
            end
          end
        end
      end
    end
  end

  describe 'instance' do
    subject { instance }
    let(:instance) { described_class.new }

    describe 'behavior' do
      describe '#by_one_artist?' do
        subject { super().by_one_artist? }

        context 'when the album\'s artist_ids' do
          let(:instance) { described_class.new(artist_ids: artist_ids) }

          context 'has one ID' do
            let(:artist_ids) { [double('artist ID')] }
            it { is_expected.to be true }
          end

          context 'has multiple IDs' do
            let(:artist_ids) { [double('artist ID'), double('other artist ID')] }
            it { is_expected.to be false }
          end
        end
      end
    end
  end
end
