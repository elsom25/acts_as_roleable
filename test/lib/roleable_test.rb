require 'minitest/pride'     # awesome colorful output
require 'minitest/reporters' # fancier output format
require 'pry'

require 'roleable'

describe Roleable do
  subject{ Roleable }

  it 'should not raise an error' do
    subject.assert_nothing_raised
  end

  it 'does stuff' do
    pending
  end
end
