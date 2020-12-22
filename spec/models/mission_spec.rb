require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'instance methods' do
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
    it 'shows time in space for each astronaut' do
      expect(Mission.space_time).to eq(45)
    end
  end
end
