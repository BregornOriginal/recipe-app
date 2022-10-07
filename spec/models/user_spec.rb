require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @subject = User.create(
      name: 'Fabien',
      email: 'test@gmail.com',
      password: '123456',
      confirmation_token: 'rxzG-sGyFUFKM5tMqKLf'
    )

    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button('Log in')

    it 'should have name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
