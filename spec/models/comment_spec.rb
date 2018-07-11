require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe  do
    context "associations" do
      it { should belong_to(:courses) }
    end
  end
end
