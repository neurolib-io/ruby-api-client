#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'insert to series' do
include_context 'set environment'

  it 'does not fail when inserting existing item into existing set' do
    req = AddItem.new('new_item')
    resp = @client.send(req)
    req = described_class.new('entity_id','item','new_item',3)
    resp = @client.send(req)
  end

  it 'does not fail when cascadeCreate is used' do
    req = described_class.new('new_set','item','new_item2',1,{'cascadeCreate' => true})
    resp = @client.send(req)
  end

  it 'really inserts item to the set' do
    req = AddItem.new('new_item3')
    resp = @client.send(req)
    req = described_class.new('entity_id','item','new_item3',2)
    resp = @client.send(req)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(NeurolibApiClient::ResponseError)
       expect(exception.status_code).to eq 409
     }
  end

end
