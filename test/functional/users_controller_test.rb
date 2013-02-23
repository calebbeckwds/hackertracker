require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { birthday: @user.birthday, date_joined: @user.date_joined, date_of_form: @user.date_of_form, ec_allergies: @user.ec_allergies, ec_cell: @user.ec_cell, ec_home: @user.ec_home, ec_name: @user.ec_name, ec_relation: @user.ec_relation, ec_second_cell: @user.ec_second_cell, ec_second_home: @user.ec_second_home, ec_second_name: @user.ec_second_name, ec_second_relation: @user.ec_second_relation, handle: @user.handle, keycard_number: @user.keycard_number, level: @user.level, mailing_address: @user.mailing_address, name: @user.name, paypal_email: @user.paypal_email, phone_number: @user.phone_number, release_authorization: @user.release_authorization, sponsor_1_name: @user.sponsor_1_name, sponsor_2_name: @user.sponsor_2_name }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { birthday: @user.birthday, date_joined: @user.date_joined, date_of_form: @user.date_of_form, ec_allergies: @user.ec_allergies, ec_cell: @user.ec_cell, ec_home: @user.ec_home, ec_name: @user.ec_name, ec_relation: @user.ec_relation, ec_second_cell: @user.ec_second_cell, ec_second_home: @user.ec_second_home, ec_second_name: @user.ec_second_name, ec_second_relation: @user.ec_second_relation, handle: @user.handle, keycard_number: @user.keycard_number, level: @user.level, mailing_address: @user.mailing_address, name: @user.name, paypal_email: @user.paypal_email, phone_number: @user.phone_number, release_authorization: @user.release_authorization, sponsor_1_name: @user.sponsor_1_name, sponsor_2_name: @user.sponsor_2_name }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
