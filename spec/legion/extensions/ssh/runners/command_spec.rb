# frozen_string_literal: true

require 'net/ssh'

RSpec.describe Legion::Extensions::Ssh::Runners::Command do
  let(:runner) { Object.new.extend(described_class) }
  let(:mock_session) { double('Net::SSH::Connection::Session') }

  before do
    allow(runner).to receive(:session).and_return(mock_session)
  end

  describe '#run' do
    it 'executes a command and returns results' do
      output = Net::SSH::Connection::Session::StringWithExitstatus.new("file1\nfile2\n", 0)
      allow(mock_session).to receive(:exec!).with('ls -la').and_return(output)
      result = runner.run(command: 'ls -la', server: '10.0.0.1')
      expect(result[:success]).to be true
      expect(result[:results]).to include('file1')
    end
  end

  describe '#run_multiple' do
    it 'is aliased from run_mulitple' do
      expect(runner.method(:run_multiple)).to eq(runner.method(:run_mulitple))
    end
  end
end
