describe "timeformat" do
  it "formats date and time nicely!" do
    expect(date_format('2018-11-22 11:16:02 UTC')).to eq '22 Nov 2018 at 11:16'
  end
end
