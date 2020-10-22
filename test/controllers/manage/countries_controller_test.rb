require 'test_helper'

class ManageCountriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    login_as users(:john)
  end

  test "should get index" do
    get manage_countries_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_country_url
    assert_response :success
  end

  test "should create new country" do
    get new_manage_country_url
    assert_response :success

    post manage_countries_url, params: { country: { name: "Germany", countryCode: "de" } }
    assert_redirected_to manage_countries_path
  end

  test "should get edit" do
    get edit_manage_country_url(id: countries(:uk))
    assert_response :success
  end

  test "should edit country" do
    get edit_manage_country_url(id: countries(:uk))
    assert_response :success

    patch manage_country_url(id: countries(:uk)), params: { country: { name: "Great Britain", countryCode: "gb" } }
    assert_redirected_to manage_countries_path

    get edit_manage_country_url(id: countries(:uk))
    assert_select "form input#country_name[value=?]", "Great Britain"
    assert_select "form input#country_countryCode[value=?]", "gb"
  end

  test "should destroy country" do
    post manage_countries_url, params: { country: { name: "Germany", countryCode: "de" } }

    country = Country.select(:id).find_by(countryCode: "de")

    delete manage_country_url(id: country.id)
    assert_redirected_to manage_countries_path
  end

  test "should not destroy country with networks" do
    delete manage_country_url(id: countries(:uk))
    assert_response :bad_request
  end
end
