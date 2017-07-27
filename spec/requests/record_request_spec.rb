require 'rails_helper'

RSpec.describe "Records" do
  scenario "GET all records at api/v1/records" do

  record = create_list(:record, 10)

  get '/api/v1/records'
  

  expect(response).to be_success
  records = JSON.parse(response.body, symbolize_names: true)
  record = records.first

  expect(records.count).to eq(10)
  expect(record).to have_key(:name)
  expect(record).to have_key(:object)
  expect(record).to have_key(:local_id)
  expect(record).to have_key(:slug)
  expect(record).to have_key(:uri)
  end
end