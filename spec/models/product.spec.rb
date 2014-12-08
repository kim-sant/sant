require 'spec_helper'

describe Product do 
  it "has a valid factory" do 
    FactoryGirl.create(:product).should be_valid 
  end
  it "is invalid without a name" 
end