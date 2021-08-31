#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'delete interaction' do
include_context 'set environment'
include_context 'set interactions'

  it 'does not fail with existing entity id' do
    req = described_class.new('user','item',{'timestamp' => 0})
    resp = @client.send(req)
    req = described_class.new('user','item')
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(NeurolibApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

end
