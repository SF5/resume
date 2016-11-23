require 'test_helper'

class OpenUniversitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @open_university = open_universities(:one)
  end

  test "should get index" do
    get open_universities_url
    assert_response :success
  end

  test "should get new" do
    get new_open_university_url
    assert_response :success
  end

  test "should create open_university" do
    assert_difference('OpenUniversity.count') do
      post open_universities_url, params: { open_university: { code: @open_university.code, course: @open_university.course, year: @open_university.year } }
    end

    assert_redirected_to open_university_url(OpenUniversity.last)
  end

  test "should show open_university" do
    get open_university_url(@open_university)
    assert_response :success
  end

  test "should get edit" do
    get edit_open_university_url(@open_university)
    assert_response :success
  end

  test "should update open_university" do
    patch open_university_url(@open_university), params: { open_university: { code: @open_university.code, course: @open_university.course, year: @open_university.year } }
    assert_redirected_to open_university_url(@open_university)
  end

  test "should destroy open_university" do
    assert_difference('OpenUniversity.count', -1) do
      delete open_university_url(@open_university)
    end

    assert_redirected_to open_universities_url
  end
end
