require 'spec_helper'

RSpec.describe Skeleton::Platform::Repositories::AlbumRepository do
  subject { described_class }

  describe 'implemented' do
    let(:test_class) do
      (stub_const "TestClass", Class.new).tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'class' do
      subject { test_class }

      describe 'behavior' do
      end
    end

    describe 'instance' do
      subject { instance }
      let(:instance) { test_class.new }

      describe 'behavior' do
        describe '#find' do
          subject { super().find(id) }
          let(:id) { double('id') }

          it { expect { subject }.to raise_error(NotImplementedError) }
        end

        describe '#by_id' do
          subject { super().by_id(id) }
          let(:id) { double('id') }

          it { expect { subject }.to raise_error(NotImplementedError) }
        end

        describe '#by_artist_id' do
          subject { super().by_artist_id(artist_id) }
          let(:artist_id) { double('artist_id') }

          it { expect { subject }.to raise_error(NotImplementedError) }
        end

        describe '#like_title' do
          subject { super().like_title(title) }
          let(:title) { double('title') }

          it { expect { subject }.to raise_error(NotImplementedError) }
        end
      end
    end
  end
end

RSpec.describe Skeleton::Platform::Repositories::NullAlbumRepository do
  describe 'instance' do
    subject { instance }
    let(:instance) { described_class.new }

    describe 'behavior' do
      describe '#find' do
        subject { super().find(id) }
        let(:id) { double('id') }

        it { expect { subject }.to raise_error(Skeleton::Platform::Repositories::AlbumRepository::NotFoundError) }
      end

      describe '#by_id' do
          subject { super().by_id(id) }
          let(:id) { double('id') }

          it { is_expected.to be_a_kind_of(Skeleton::Platform::NullAlbum) }
        end

        describe '#by_artist_id' do
          subject { super().by_artist_id(artist_id) }
          let(:artist_id) { double('artist_id') }

          it { is_expected.to eq([]) }
        end

        describe '#like_title' do
          subject { super().like_title(title) }
          let(:title) { double('title') }

          it { is_expected.to eq([]) }
        end
    end
  end
end
