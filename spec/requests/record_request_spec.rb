require 'rails_helper'

RSpec.describe "Records" do
  scenario "GET all records at api/v1/records" do

    record = create(:record, name: "Cooking")
    record = create(:record, name: "Cleaning")
    record = create(:record, name: "Mowing")
    record = create(:record, name: "Landscaping")
    record = create(:record, name: "Farming")
    get '/api/v1/records'
    

    expect(response).to be_success
    records = JSON.parse(response.body, symbolize_names: true)
    record = records.first

    expect(records.count).to eq(5)
    expect(record).to have_key(:name)
    expect(record).to have_key(:object)
    expect(record).to have_key(:local_id)
    expect(record).to have_key(:slug)
    expect(record).to have_key(:uri)
  end

  scenario "GET all records based on query at api/v1/records?query=" do

    record1 = create(:record, name: "Cooking")
    record2 = create(:record, name: "Dancing")
    record3 = create(:record, name: "Inspections")

    get '/api/v1/records?query=ing'

    expect(response).to be_success
    records = JSON.parse(response.body, symbolize_names: true)

    expect(records.count).to eq(2)
    expect(records.first[:name]).to eq(record1.name)
    expect(records.last[:name]).to eq(record2.name)
  end

  scenario "POST record at api/v1/record successfully " do

    record1 = build(:record, name: "Cooking")
    expect(Record.count).to eq(0)

    post "/api/v1/records?record[name]=#{record1.name}&record[object]=#{record1.object}&record[local_id]=#{record1.local_id}&record[uri]=#{record1.uri}&record[slug]=#{record1.slug}"
    

    expect(response).to be_success
    record = JSON.parse(response.body, symbolize_names: true) 
    expect(Record.count).to eq(1)
    expect(record[:name]).to eq(record1.name)
    expect(record[:slug]).to eq(record1.slug)
    expect(record[:uri]).to eq(record1.uri)
    expect(record[:local_id]).to eq(record1.local_id)
    expect(record[:object]).to eq(record1.object)
    
  end

  scenario "POST record at api/v1/record unsuccesfully" do

    record1 = build(:record, name: "Cooking")
    expect(Record.count).to eq(0)

    post "/api/v1/records?record[name]=#{record1.name}&record[object]=#{record1.object}&record[uri]=#{record1.uri}&record[slug]=#{record1.slug}"
    


    expect(response.status).to eq(400)
    record = JSON.parse(response.body, symbolize_names: true) 

    expect(Record.count).to eq(0)
    expect(record[:status]).to eq(400)
    expect(record[:message]).to be_a Hash
    expect(record[:message][:local_id]).to eq(["can't be blank"])
  end

  scenario "DELETE record at api/v1/record/:id" do

    record1 = create(:record)
    expect(Record.count).to eq(1)

    delete "/api/v1/records/#{record1.id}"
    
    expect(response.status).to eq(204)
    expect(Record.count).to eq(0)

  end

  scenario "UPDATE record at api/v1/record/:id" do

    record1 = create(:record)
    expect(Record.count).to eq(1)

    put "/api/v1/records/#{record1.id}?record[name]=new+name"
    
    expect(response).to be_success 
    expect(response.status).to eq(202)
    record = JSON.parse(response.body, symbolize_names: true)
    
    expect(record[:record][:name]).to eq('new name')
    expect(record[:record][:uri]).to eq(record1.uri)
    expect(record[:record][:slug]).to eq(record1.slug)
    expect(record[:record][:object]).to eq(record1.object)
    expect(record[:record][:local_id]).to eq(record1.local_id)
  end
  
  scenario "UPDATE record at api/v1/record/:id" do

    record1 = create(:record, name: "Cleaning")
    record2 = create(:record)

    put "/api/v1/records/#{record2.id}?record[name]=Cleaning"
    
    expect(response.status).to eq(400)
    record = JSON.parse(response.body, symbolize_names: true)
    expect(record[:message][:name]).to eq(["is already taken"])
  end
end