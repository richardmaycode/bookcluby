require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "associations" do
    it { should belong_to(:user) } 
    it { should have_many(:recommendations) } 
  end
  

  describe "validations" do
    it { should validate_presence_of(:title) }  
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:pages) }
    it { should validate_numericality_of(:pages).is_greater_than(49).is_less_than(2001) }
    it { should validate_presence_of(:description) }
  end

end
