# frozen_string_literal: true

require 'test_helper'

class Web::SessionsControllerTest < ActionDispatch::IntegrationTest
  test '#new' do
    get new_session_path
    assert_response :success
  end

  test '#create (sign in)' do
    user = users(:one)

    post session_path, params: {
      user: {
        username: user[:username],
        password: 'password'
      }
    }

    assert { signed_in? }
    assert_redirected_to root_path
  end

  test '#destroy (sign out)' do
    delete session_path

    assert_not signed_in?
    assert_redirected_to new_session_path
  end
end
