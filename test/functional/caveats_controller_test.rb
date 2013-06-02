require 'test_helper'

class CaveatsControllerTest < ActionController::TestCase
  setup do
    @caveat = caveats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caveats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caveat" do
    assert_difference('Caveat.count') do
      post :create, caveat: { body: @caveat.body, fuid: @caveat.fuid, user_id: @caveat.user_id }
    end

    assert_redirected_to caveat_path(assigns(:caveat))
  end

  test "should show caveat" do
    get :show, id: @caveat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caveat
    assert_response :success
  end

  test "should update caveat" do
    put :update, id: @caveat, caveat: { body: @caveat.body, fuid: @caveat.fuid, user_id: @caveat.user_id }
    assert_redirected_to caveat_path(assigns(:caveat))
  end

  test "should destroy caveat" do
    assert_difference('Caveat.count', -1) do
      delete :destroy, id: @caveat
    end

    assert_redirected_to caveats_path
  end
end
