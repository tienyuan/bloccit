describe Vote do
  describe "validations" do
    describe "value validations" do
      it "only allows -1 or 1 as values" do
        expect( Vote.new == 1 || Vote.new == -1 ).to eq(true)
    end
  end
end