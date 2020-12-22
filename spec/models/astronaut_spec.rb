require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    before :each do
      @astronaut_1 = Astronaut.create!(name: "Adam", age: 35, job: "Pilot")
      @astronaut_2 = Astronaut.create!(name: "Beatrix", age: 45, job: "Engineer")
      @astronaut_3 = Astronaut.create!(name: "Colton", age: 55, job: "Cook")
      visit '/astronauts'
    end
    it 'average_age' do
      expect(Astronaut.average_age).to eq(45)
    end
  end
end
