require 'spec_helper'

RSpec.describe Skeleton::Platform::Configuration::Repositories do
  subject { described_class }

  describe 'instance' do
    subject { instance }
    let(:instance) { described_class.new }

    describe 'behavior' do
      describe '#albums' do
        subject { super().albums }

        it { is_expected.to be_a_kind_of(Skeleton::Platform::Repositories::NullAlbumRepository) }
      end

      describe '#albums=' do
        subject { super().albums = repository }
        let(:repository) { double('repository') }

        context 'causes side effect' do
          describe '#albums' do
            subject { super(); instance.albums }
            it { is_expected.to be(repository) }
          end
        end
      end

      describe '#artists' do
        subject { super().artists }

        it { is_expected.to be_a_kind_of(Skeleton::Platform::Repositories::NullArtistRepository) }
      end

      describe '#artists=' do
        subject { super().artists = repository }
        let(:repository) { double('repository') }

        context 'causes side effect' do
          describe '#artists' do
            subject { super(); instance.artists }
            it { is_expected.to be(repository) }
          end
        end
      end
    end
  end
end
