require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'with validations' do
    it 'will not save if name is nil' do
      plan = described_class.new
      plan.name = nil
      plan.ingredients = 'Test ingredients'

      expect(plan).not_to be_valid
    end

    it 'will not save if ingredients is nil' do
      plan = described_class.new
      plan.name = 'test name'
      plan.ingredients = nil

      expect(plan).not_to be_valid
    end

    it 'will not save if ingredients length is less than 5' do
      plan = described_class.new
      plan.name = 'test name'
      plan.ingredients = 'test'

      expect(plan).not_to be_valid
    end

    it 'will not save if ingredients length is more than 200' do
      plan = described_class.new
      plan.name = 'test name'
      plan.ingredients = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."

      expect(plan).not_to be_valid
    end
  end
end
