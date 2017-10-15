require 'spec_helper'

RSpec.describe Skeleton::Platform::Configuration do
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
        describe '#configure' do
          it { expect { |b| subject.configure(&b) }.to yield_with_args(test_class.settings) }
        end

        describe '#settings' do
          subject { super().settings }

          it { is_expected.to be_a_kind_of(Skeleton::Platform::Configuration::Settings) }
        end

        describe '#settings=' do
          subject { super().settings = settings }
          let(:settings) { instance_double(Skeleton::Platform::Configuration::Settings) }

          context 'causes side effect' do
            describe '#settings' do
              subject { super(); test_class.settings }
              it { is_expected.to be(settings) }
            end
          end
        end

        describe '#repositories' do
          subject { super().repositories }
          it { is_expected.to be(test_class.settings.repositories) }
        end
      end
    end

    describe 'instance' do
      subject { instance }
      let(:instance) { test_class.new }

      describe 'behavior' do
      end
    end
  end
end