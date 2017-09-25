def common_api_response(resp_data, resp_status, resp_message, resp_errors)
  render json: json_builder(resp_data, resp_status, resp_message, errors: resp_errors)
end