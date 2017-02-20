require_relative "../spec_helper"
require_relative "uri_gets_counter_helper"

RSpec.describe "uri_gets_counter_helper" do
  let(:input_sample) { ["3", "115380", "2819311", "23456"] }

  it do
    expect(gets.to_i).to eql(3)
  end

  it do
    expect(gets).to eql("3")
  end

  it do
    gets
    expect(gets).to eql("115380")
  end

  it do
    gets
    gets
    expect(gets).to eql("2819311")
  end
end
