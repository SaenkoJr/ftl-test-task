# frozen_string_literal: true

require 'test_helper'

class Web::SpendingsControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    sign_in_as(:one)
    get spendings_path
    assert_response :success
  end

  test '#index (guest must be redirected)' do
    get spendings_path
    assert_redirected_to new_session_path
  end

  test '#new' do
    sign_in_as(:one)
    get new_spending_path
    assert_response :success
  end

  test '#new (guest must be redirected)' do
    get new_spending_path
    assert_redirected_to new_session_path
  end

  test '#edit' do
    sign_in_as(:one)
    spending = spendings(:one)

    get edit_spending_path(spending)
    assert_response :success
  end

  test '#edit (non author must be redirected)' do
    spending = spendings(:one)

    get edit_spending_path(spending)
    assert_redirected_to new_session_path
  end

  test '#show' do
    sign_in_as(:one)
    spending = spendings(:one)
    get spending_path(spending)
    assert_response :success
  end

  test '#show (non author must be redirected)' do
    spending = spendings(:one)
    get spending_path(spending)
    assert_redirected_to new_session_path
  end

  test '#create' do
    user = sign_in_as(:one)
    category = categories(:one)
    spending_attrs = {
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      amount: 55.2,
      category_id: category.id
    }

    assert_difference('Spending.count', +1) do
      post spendings_path, params: { spending: spending_attrs }
    end

    spending = Spending.last

    assert { spending }
    assert_equal spending.name, spending_attrs[:name]
    assert_equal spending.category, category
    assert_equal spending.user, user
    assert_redirected_to root_path
  end

  test '#create (non author must be redirected)' do
    category = categories(:one)
    spending_attrs = {
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      amount: 55.2,
      category_id: category.id
    }

    assert_no_difference('Spending.count') do
      post spendings_path, params: { spending: spending_attrs }
    end

    assert_redirected_to new_session_path
  end

  test '#update' do
    sign_in_as(:one)
    spending = spendings(:one)
    category = categories(:two)
    new_attrs = {
      name: Faker::Lorem.sentence,
      category_id: category.id
    }

    patch spending_path(spending), params: { spending: new_attrs }

    spending.reload
    assert_equal spending.name, new_attrs[:name]
    assert_equal spending.category, category
    assert_redirected_to spending_path(spending)
  end

  test '#update (non author must be redirected)' do
    spending = spendings(:one)
    new_attrs = {
      name: Faker::Lorem.sentence
    }

    patch spending_path(spending), params: { spending: new_attrs }

    spending.reload
    assert_redirected_to new_session_path
  end

  test '#destroy' do
    sign_in_as(:one)
    spending = spendings(:one)
    assert_difference('Spending.count', -1) do
      delete spending_path(spending)
    end
    assert_redirected_to root_path
  end

  test '#destroy (non author must be redirected)' do
    spending = spendings(:one)
    assert_no_difference('Spending.count') do
      delete spending_path(spending)
    end
    assert_redirected_to new_session_path
  end
end
