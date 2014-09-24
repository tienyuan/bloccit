require 'rails_helper'

describe Vote do

  include TestFactories
  include Devise::TestHelpers

  describe "validations" do

    it "only allows 1" do
      vote = Vote.new(value: 1)
      expect( vote.valid? ).to eq(true)
    end

    it "only allows -1" do
      vote = Vote.new(value: -1)
      expect( vote.valid? ).to eq(true)
    end

    it "doesn't allow 2" do
      [-2, 0, 2].each do |invalid_value|
        vote = Vote.new(value: invalid_value)
        expect( vote.valid? ).to eq(false)
      end
    end    
  end

  describe "after save" do
    it "calls `Post#update_rank` after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
        vote.save
    end
  end
end