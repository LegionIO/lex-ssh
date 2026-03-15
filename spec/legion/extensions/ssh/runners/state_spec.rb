# frozen_string_literal: true

require 'net/ssh'

RSpec.describe Legion::Extensions::Ssh::Runners::State do
  let(:runner) { Object.new.extend(described_class) }
  let(:mock_session) { double('Net::SSH::Connection::Session') }

  before do
    allow(runner).to receive(:session).and_return(mock_session)
  end

  describe '#reboot' do
    it 'sends shutdown -r command' do
      output = Net::SSH::Connection::Session::StringWithExitstatus.new('', 0)
      allow(mock_session).to receive(:exec!).with('shutdown -r now').and_return(output)
      result = runner.reboot(server: '10.0.0.1')
      expect(result[:success]).to be true
    end
  end

  describe '#shutdown' do
    it 'sends shutdown -h command' do
      output = Net::SSH::Connection::Session::StringWithExitstatus.new('', 0)
      allow(mock_session).to receive(:exec!).with('shutdown -h now').and_return(output)
      result = runner.shutdown(server: '10.0.0.1')
      expect(result[:success]).to be true
    end
  end
end
