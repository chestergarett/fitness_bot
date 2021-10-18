require 'rails_helper'

RSpec.describe ClientProfile, type: :model do
  describe '#presence to user' do
    it { should belong_to :user }
  end
end