require 'spec_helper'

RSpec.describe Skeleton::Platform::Repositories::ArtistRepository do
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

        describe '#by_album_id' do
          subject { super().by_album_id(album_id) }
          let(:album_id) { double('album_id') }

          it { expect { subject }.to raise_error(NotImplementedError) }
        end

        describe '#like_name' do
          subject { super().like_name(name) }
          let(:name) { double('name') }

          it { expect { subject }.to raise_error(NotImplementedError) }
        end
      end
    end
  end
end

RSpec.describe Skeleton::Platform::Repositories::NullArtistRepository do
  describe 'instance' do
    subject { instance }
    let(:instance) { described_class.new }

    describe 'behavior' do
      describe '#find' do
        subject { super().find(id) }
        let(:id) { double('id') }

        it { expect { subject }.to raise_error(Skeleton::Platform::Repositories::ArtistRepository::NotFoundError) }
      end

      describe '#by_id' do
          subject { super().by_id(id) }
          let(:id) { double('id') }

          it { is_expected.to be_a_kind_of(Skeleton::Platform::NullArtist) }
        end

        describe '#by_album_id' do
          subject { super().by_album_id(album_id) }
          let(:album_id) { double('album_id') }

          it { is_expected.to eq([]) }
        end

        describe '#like_name' do
          subject { super().like_name(name) }
          let(:name) { double('name') }

          it { is_expected.to eq([]) }
        end
    end
  end
end
