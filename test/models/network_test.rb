require 'test_helper'

class NetworkTest < ActiveSupport::TestCase
  test "should save a valid network" do
    network = Network.new
    network.name = "Ubitricity"
    network.description = "Some amazing description..."
    network.slug = "ubitricity"
    network.website_url = "https://www.ubitricity.co.uk/residential_charging/"
    network.country = countries(:uk)

    assert network.valid?
  end

  test "should not save network without :name" do
    network = Network.new(name: nil)

    assert_not network.valid?
    assert_includes network.errors.keys, :name
  end

  test "should not save network without :description" do
    network = Network.new(description: nil)

    assert_not network.valid?
    assert_includes network.errors.keys, :description
  end

  test "should not save network without valid :slug" do
    network = Network.new(slug: nil)

    assert_not network.valid?
    assert_includes network.errors.keys, :slug

    network.slug = "this-is-an/invalid-slug"

    assert_not network.valid?
    assert_includes network.errors.keys, :slug

    network.slug = "this-is-an-invalid-slug-"

    assert_not network.valid?
    assert_includes network.errors.keys, :slug
  end

  test "should not save network without :website_url" do
    network = Network.new(website_url: nil)

    assert_not network.valid?
    assert_includes network.errors.keys, :website_url
  end

  test "should not save network without :country" do
    network = Network.new(country: nil)

    assert_not network.valid?
    assert_includes network.errors.keys, :country
  end

  test "should not save network with an invalid :android_app_url" do
    network = Network.new(android_app_url: "https://an-invalid-anroid-app-url.com")

    assert_not network.valid?
    assert_includes network.errors.keys, :android_app_url
  end

  test "should validate network with an valid :android_app_url" do
    network = Network.new(android_app_url: "https://play.google.com/store/apps/details?id=com.ubitricity")

    network.valid?
    assert_not_includes network.errors.keys, :android_app_url
  end

  test "should not save network with an invalid :ios_app_url" do
    network = Network.new(ios_app_url: "https://an-invalid-app-store-url.com")

    assert_not network.valid?
    assert_includes network.errors.keys, :ios_app_url
  end

  test "should validate network with an valid :ios_app_url" do
    network = Network.new(ios_app_url: "https://apps.apple.com/gb/app/ubitricity/id1031238194")

    network.valid?
    assert_not_includes network.errors.keys, :ios_app_url
  end
end
