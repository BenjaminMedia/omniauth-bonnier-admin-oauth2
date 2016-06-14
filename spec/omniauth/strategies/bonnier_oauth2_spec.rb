require "spec_helper"

describe OmniAuth::Strategies::BonnierAdminOauth2 do
  let(:request) { double(:request, params: {}, cookies: {}, env: {}) }
  let(:parsed_response) { double(:parsed_response) }
  let(:response) { double(:response, :parsed => parsed_response) }
  let(:access_token) { double(:access_token, options: {}) }

  subject do
    args = ["appid", "secret", @options || {}]
    described_class.new(*args).tap do |strategy|
#    OmniAuth::Strategies::BonnierAdminOauth2.new(*args).tap do |strategy|
      allow(strategy).to receive(:request).and_return(request)
    end
  end

  describe "client options" do
    let(:site_url) { "http://localhost:3000" }
    let(:authorize_url) { "/oauth/authorize" }
    let(:token_url) { "/oauth/token" }

    it "has correct name" do
      expect(subject.options.name).to eq("bonnier_admin_oauth2")
    end

    it "has correct site" do
      expect(subject.options.client_options.site).to eq(site_url)
    end

    it "has correct authorize url" do
      expect(subject.options.client_options.authorize_url).to eq(authorize_url)
    end

    it "has correct token url" do
      expect(subject.options.client_options.token_url).to eq(token_url)
    end
  end

  describe "#uid" do
    #let(:raw_info) { {"user" => {"id" => "123"}} }
    let(:uid) { "123" }
    let(:raw_info) { {"id" => uid} }
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info)
    end

    it "returns the id from raw_info" do
      expect(subject.uid).to eq(uid)
    end
  end

  describe "#info" do
    #let(:raw_info) { {"user" => {"first_name" => "Mike", "email" => "mike@example.com"}} }
    let(:first_name) { "Mike" }
    let(:email) { "mike@example.com" }
    let(:raw_info) { {"first_name" => first_name, "email" => email} }

    before :each do
      allow(subject).to receive(:raw_info).and_return(raw_info)
    end

    it "returns the first_name from raw_info" do
      expect(subject.info[:first_name]).to eq(first_name)
    end

    it "returns the email from raw_info as email" do
      expect(subject.info[:email]).to eq(email)
    end
  end

  describe "#extra" do
  end

  describe "#raw_info" do
  end
end
