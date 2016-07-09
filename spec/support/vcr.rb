module VCR
  def self.http_requests_made
    @http_requests_made ||= []
  end
end

VCR.configure do |c|
  c.configure_rspec_metadata!
  c.cassette_library_dir = Rails.root.join("spec", "vcr")
  c.hook_into :webmock
  c.filter_sensitive_data("[secret_key]") { Stripe.api_key }
  c.ignore_hosts "codeclimate.com"
  c.ignore_localhost = true
  c.after_http_request do |request, _response|
    VCR.http_requests_made << request
  end

  c.register_request_matcher :valid_paid_plan do |actual, match|
    if actual.body.blank?
      true
    else
      actual_params = Rack::Utils.parse_nested_query(actual.body)
      match_params  = Rack::Utils.parse_nested_query(match.body)

      valid_token = if stripe_token = actual_params.delete("card")
        stripe_token[/tok_\w+/]
      else
        true
      end

      matching_params = actual_params.keys.all? do |key|
        actual_params[key] == match_params[key]
      end

      valid_token && matching_params
    end
  end

  c.register_request_matcher :form do |actual, match|
    content_type = actual.headers["Content-Type"]

    # Only valid for forms
    if content_type.include?("application/x-www-form-urlencoded")
      actual_form = Rack::Utils.parse_nested_query(actual.body)
      match_form  = Rack::Utils.parse_nested_query(match.body)

      actual_form == match_form
    else
      false
    end
  end
end

RSpec.configure do |config|
  config.before(:each) do
    VCR.http_requests_made.clear
  end

  config.around(:each, vcr: false) do |example|
    VCR.turned_off do
      example.run
    end
  end
end
