require 'test_helper'

class AntibiogramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @antibiogram = antibiograms(:one)
  end

  test "should get index" do
    get antibiograms_url
    assert_response :success
  end

  test "should get new" do
    get new_antibiogram_url
    assert_response :success
  end

  test "should create antibiogram" do
    assert_difference('Antibiogram.count') do
      post antibiograms_url, params: { antibiogram: {  } }
    end

    assert_redirected_to antibiogram_url(Antibiogram.last)
  end

  test "should show antibiogram" do
    get antibiogram_url(@antibiogram)
    assert_response :success
  end

  test "should get edit" do
    get edit_antibiogram_url(@antibiogram)
    assert_response :success
  end

  test "should update antibiogram" do
    patch antibiogram_url(@antibiogram), params: { antibiogram: {  } }
    assert_redirected_to antibiogram_url(@antibiogram)
  end

  test "should destroy antibiogram" do
    assert_difference('Antibiogram.count', -1) do
      delete antibiogram_url(@antibiogram)
    end

    assert_redirected_to antibiograms_url
  end
end
