# frozen_string_literal: true

require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  test '#new' do
    get new_user_path
    assert_response :success
  end

  test '#show' do
    user = users(:one)
    get user_path(user.username)
    assert_response :success
  end

  test '#create' do
    user_attrs = {
      username: 'username',
      password: 'password',
      password_digest: 'password'
    }

    assert_difference('User.count', +1) do
      post users_path, params: { user: user_attrs }
    end
    assert_redirected_to root_path

    user = User.find_by(username: user_attrs[:username])
    assert { user }
  end
end
