require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'with validations' do
    it 'will not save if title is nil' do
      food = described_class.new
      food.title = nil
      food.description = 'Test description'
      food.end_date = Time.zone.now

      expect(food).not_to be_valid
    end

    it 'will not save if description is nil' do
      food = described_class.new
      food.title = 'test title'
      food.description = nil
      food.end_date = Time.zone.now

      expect(food).not_to be_valid
    end

    it 'will not save if description length is less than 5' do
      food = described_class.new
      food.title = 'test title'
      food.description = 'test'
      food.end_date = Time.zone.now

      expect(food).not_to be_valid
    end

    it 'will not save if description length is more than 200' do
      food = described_class.new
      food.title = 'test title'
      food.description = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
      food.end_date = Time.zone.now

      expect(food).not_to be_valid
    end

    it 'will not save if end date is empty' do
      food = described_class.new
      food.title = 'test title'
      food.description = 'There are many variations of passages'
      food.end_date = nil

      expect(food).not_to be_valid
    end
  end
end
