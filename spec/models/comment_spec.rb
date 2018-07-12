require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe  do
    context "associations" do
      it { should belong_to(:course) }
    end
  end
end
