# encoding: utf-8
require "mini_spec_helper"

require APP_ROOT + '/app/models/beer'

describe Beer do
  subject { Beer.new(name: 'Carlsberg', description: 'Hof' )}

  it "should have a full name" do
    subject.full_name.should == 'Carlsberg Hof'
  end

end
