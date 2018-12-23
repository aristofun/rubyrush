require 'hashtags'

describe 'hashtags' do
  it 'returns single hastag' do
    expect(hashtags('words with #tags')).to eq %w(#tags)
  end

  it 'returns multiple hastags' do
    expect(hashtags('#words with #tags')).to eq %w(#words #tags)
  end

  it 'returns hastags with russian' do
    expect(hashtags('слова с #тегами')).to eq %w(#тегами)
  end

  it 'returns hastags with underscores' do
    expect(hashtags('words #with_tags')).to eq %w(#with_tags)
  end

  it 'returns hastags with minuses' do
    expect(hashtags('words #with-tags')).to eq %w(#with-tags)
  end

  it 'does not return question mark' do
    expect(hashtags('words #with? tags')).to eq %w(#with)
  end

  it 'does not return exclamation mark' do
    expect(hashtags('words #with! tags')).to eq %w(#with)
  end
end
