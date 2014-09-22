require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      v = Vote.new(value: 1)
      v2 = Vote.new(value: -1)
      v3 = Vote.new(value: 2)
    end

    describe "#allows 1" do
      it "only allows 1" do
        expect( v.valid? ).to eq(true)
      end
    end
    describe "#allows -1" do
      it "only allows -1" do
        expect( v2.valid? ).to eq(true)
      end
    end
    describe "#rejects bad votes" do
      it "doesn't allow 2" do
        expect( v3.valid? ).to eq(false)
      end
    end    
  end
end