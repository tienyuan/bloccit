require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      @v = Vote.create(value: 1)
      @v2 = Vote.create(value: 1)
      @v3 = Vote.create(value: 2)
    end

    describe "#valid vote" do
      it "only allows 1" do
        expect( @v.valid? ).to eq(true)
      end
    end
    describe "#valid vote #2" do
      it "only allows -1" do
        expect( @v2.valid? ).to eq(true)
      end
    end
    describe "#invalid vote" do
      it "doesn't allow 2" do
        expect( @v3.valid? ).to eq(false)
      end
    end    
  end
end