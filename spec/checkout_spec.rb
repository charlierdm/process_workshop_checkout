require 'checkout'

describe Checkout do

  it 'returns -1 when passed anything other than capital letters' do
    expect(subject.total('aBc')).to eql(-1)
  end

  it 'returns -1 when passed anything other than capital letters' do
    expect(subject.total('-B8x')).to eql(-1)
  end

  it 'returns -1 when passed anything other than capital letters' do
    expect(subject.total('18')).to eql(-1)
  end

  it 'returns 100 when passed AA' do
    expect(subject.total('AA')).to eql(100)
  end

  it 'returns 115 when passed ABCD' do
    expect(subject.total('ABCD')).to eql(115)
  end

  it 'calculates a special offer when the user buys 3 * item A' do
    expect(subject.total('AAA')).to eql(130)
  end

  it 'calculates a special offer having already rewarded the user with one' do
    expect(subject.total('AAAAAA')).to eql(260)
  end

  it 'calculates the special offers for item A and B' do
    expect(subject.total('ABABA')).to eql(175)
  end
  it 'calculates the multiple special offers for item A and B' do
    expect(subject.total('ABABAABABA')).to eql(350)
  end
  
end
