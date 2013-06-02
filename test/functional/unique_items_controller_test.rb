require 'test_helper'

class UniqueItemsControllerTest < ActionController::TestCase
  setup do
    @unique_item = unique_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unique_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unique_item" do
    assert_difference('UniqueItem.count') do
      post :create, unique_item: { area: @unique_item.area, loggable: @unique_item.loggable, name: @unique_item.name, photo: @unique_item.photo, ticketable: @unique_item.ticketable }
    end

    assert_redirected_to unique_item_path(assigns(:unique_item))
  end

  test "should show unique_item" do
    get :show, id: @unique_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unique_item
    assert_response :success
  end

  test "should update unique_item" do
    put :update, id: @unique_item, unique_item: { area: @unique_item.area, loggable: @unique_item.loggable, name: @unique_item.name, photo: @unique_item.photo, ticketable: @unique_item.ticketable }
    assert_redirected_to unique_item_path(assigns(:unique_item))
  end

  test "should destroy unique_item" do
    assert_difference('UniqueItem.count', -1) do
      delete :destroy, id: @unique_item
    end

    assert_redirected_to unique_items_path
  end
end
