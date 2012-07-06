require 'spec_helper'

describe User do

  describe ".find_by_email_or_username" do

    let!(:user) { Fabricate(:user, email: 'sam@example.com', username: 'sam')}
    subject{ User.find_by_email_or_username(email_or_username) }

    context "when using email" do
      let(:email_or_username) { 'sam@example.com' }
      describe '.find_by_email_or_username' do
        it do
          should == user
        end
      end
    end

    context "when using username" do
      let(:email_or_username) { 'sam' }
      describe '.find_by_email_or_username' do
        it do
          should == user
        end
      end
    end

  end


end
