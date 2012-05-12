# encoding: utf-8
require "spec_helper"

describe Beer do
  subject { Beer.new(name: 'Carlsberg', description: 'Hof' )}

  it "should have a full name" do
    subject.full_name.should == 'Carlsberg Hof'
  end

  describe "scoring" do
    before do
      Beer.destroy_all
      User.destroy_all

      subject.save!
      user1 = User.create(email: 'test@test.se', password: 'asdasd', password_confirmation: 'asdasd')
      user1.check_ins.create(beer: subject, rating: 5)
      user1.save!

      user1 = User.create(email: 'test2@test.se', password: 'asdasd', password_confirmation: 'asdasd')
      user1.check_ins.create(beer: subject, rating: 7)
      user1.save!
    end

    it "should have a score" do
      subject.score.should == 60
    end
  end

end
