require_relative "../acronymize"

describe "#acronymize" do
  it "returns an empty string when passed an empty string" do
    actual = acronymize("")
    expected = ""
    expect(actual).to eq(expected) # passes if `actual == expected`
  end

  it "returns the acronym on downcased sentences" do
    actual = acronymize("working from home")
    expected = "WFH"
    expect(actual).to eq(expected)
  end

  it "returns the acronym on upcased sentences" do
    actual = acronymize("AWAY FROM KEYBOARD")
    expected = "AFK"
    expect(actual).to eq(expected)
  end
end
