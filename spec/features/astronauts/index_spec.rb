require 'rails_helper'

describe Astronaut do
  describe 'As a visitor' do
    describe 'When I visit the index page' do
      before :each do
        @astronaut_1 = Astronaut.create!(name: "Adam", age: 35, job: "Pilot")
        @astronaut_2 = Astronaut.create!(name: "Beatrix", age: 45, job: "Engineer")
        @astronaut_3 = Astronaut.create!(name: "Colton", age: 55, job: "Cook")
        @mission_1 = Mission.create!(title: "A", time_in_space: 10)
        @mission_2 = Mission.create!(title: "B", time_in_space: 15)
        @mission_3 = Mission.create!(title: "C", time_in_space: 20)
        AstronautMission.create!(mission_id: @mission_1.id, astronaut_id: @astronaut_1.id)
        AstronautMission.create!(mission_id: @mission_2.id, astronaut_id: @astronaut_1.id)
        AstronautMission.create!(mission_id: @mission_3.id, astronaut_id: @astronaut_1.id)
        visit '/astronauts'
      end
      it 'Shows a list of astronauts with attributes' do
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_3.name)
        expect(page).to have_content(@astronaut_1.age)
        expect(page).to have_content(@astronaut_2.age)
        expect(page).to have_content(@astronaut_3.age)
        expect(page).to have_content(@astronaut_1.job)
        expect(page).to have_content(@astronaut_2.job)
        expect(page).to have_content(@astronaut_3.job)
      end
      it 'Shows list of missions for each astronaut by name' do
        expect(@astronaut_1.list_missions.first.title).to eq("A")
        expect(@astronaut_1.list_missions.last.title).to eq("C")
      end
      it 'shows time in space for each astronaut' do
        expect(@astronaut_1.missions.space_time).to eq(45)
      end
    end
  end
end
