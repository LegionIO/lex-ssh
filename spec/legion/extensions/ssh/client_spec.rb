# frozen_string_literal: true

RSpec.describe Legion::Extensions::Ssh::Client do
  describe '#initialize' do
    it 'stores server and user' do
      client = described_class.new(server: '10.0.0.1', user: 'deploy')
      expect(client.opts).to include(server: '10.0.0.1', user: 'deploy')
    end

    it 'defaults user to root' do
      client = described_class.new(server: '10.0.0.1')
      expect(client.opts[:user]).to eq('root')
    end
  end

  describe 'runner methods' do
    let(:client) { described_class.new(server: '10.0.0.1') }

    it 'responds to command methods' do
      expect(client).to respond_to(:run, :run_mulitple, :run_multiple)
    end

    it 'responds to state methods' do
      expect(client).to respond_to(:reboot, :shutdown)
    end
  end
end
