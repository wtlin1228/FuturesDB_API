# frozen_string_literal: true

#  FuturesDB service
class FuturesDB < Sinatra::Base
  # Get the member's information by phone and email
  get "/#{API_VER}/member/:phone/:email/?" do
    result = MemberInfo.call(params)

    content_type 'application/json'
    result.value
  end 

  # Create a new member
  post "/#{API_VER}/member/create/?" do
    result = MemberCreate.call(request.body.read)

    if result.success?
      MemberRepresenter.new(result.value).to_json
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end

  # Update the member's information
  post "/#{API_VER}/member/update/?" do
    result = MemberUpdate.call(request.body.read)

    if result.success?
      MemberRepresenter.new(result.value).to_json
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end

  # Delete the member
  post "/#{API_VER}/member/delete/?" do
    result = MemberDelete.call(request.body.read)
    if result.success?
      content_type 'text/plain'
      result.value
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end

end
