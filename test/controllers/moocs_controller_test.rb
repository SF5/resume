require 'test_helper'

class MooCsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mooc = moocs(:one)
  end

  test "should get index" do
    get moocs_url
    assert_response :success
  end

  test "should get new" do
    get new_mooc_url
    assert_response :success
  end

  test "should create mooc" do
    assert_difference('Mooc.count') do
      post moocs_url, params: { mooc: { course: @mooc.course, institute: @mooc.institute, title: @mooc.title, verified: @mooc.verified, year: @mooc.year } }
    end

    assert_redirected_to mooc_url(Mooc.last)
  end

  test "should show mooc" do
    get mooc_url(@mooc)
    assert_response :success
  end

  test "should get edit" do
    get edit_mooc_url(@mooc)
    assert_response :success
  end

  test "should update mooc" do
    patch mooc_url(@mooc), params: { mooc: { course: @mooc.course, institute: @mooc.institute, verified: @mooc.verified, year: @mooc.year } }
    assert_redirected_to mooc_url(@mooc)
  end

  test "should destroy mooc" do
    assert_difference('Mooc.count', -1) do
      delete mooc_url(@mooc)
    end

    assert_redirected_to moocs_url
  end
end
