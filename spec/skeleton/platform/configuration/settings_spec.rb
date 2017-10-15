require 'spec_helper'

RSpec.describe Skeleton::Platform::Configuration::Settings do
  subject { described_class }

  describe 'instance' do
    subject { instance }
    let(:instance) { described_class.new }

    describe 'behavior' do
      describe '#repositories' do
        subject { super().repositories }

        it { is_expected.to be_a_kind_of(Skeleton::Platform::Configuration::Repositories) }
      end

      describe '#repositories=' do
        subject { super().repositories = repositories }
        let(:repositories) { double('repositories') }

        context 'causes side effect' do
          describe '#repositories' do
            subject { super(); instance.repositories }
            it { is_expected.to be(repositories) }
          end
        end
      end
    end
  end
end
