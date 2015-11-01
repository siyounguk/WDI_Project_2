require 'test_helper'

class PedalsControllerTest < ActionController::TestCase
  setup do
    @pedal = pedals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedal" do
    assert_difference('Pedal.count') do
      post :create, pedal: { name: @pedal.name, pedal_photo: @pedal.pedal_photo, price_paid: @pedal.price_paid, review: @pedal.review, rig_id: @pedal.rig_id, type: @pedal.type, user_id: @pedal.user_id }
    end

    assert_redirected_to pedal_path(assigns(:pedal))
  end

  test "should show pedal" do
    get :show, id: @pedal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedal
    assert_response :success
  end

  test "should update pedal" do
    patch :update, id: @pedal, pedal: { name: @pedal.name, pedal_photo: @pedal.pedal_photo, price_paid: @pedal.price_paid, review: @pedal.review, rig_id: @pedal.rig_id, type: @pedal.type, user_id: @pedal.user_id }
    assert_redirected_to pedal_path(assigns(:pedal))
  end

  test "should destroy pedal" do
    assert_difference('Pedal.count', -1) do
      delete :destroy, id: @pedal
    end

    assert_redirected_to pedals_path
  end
end
