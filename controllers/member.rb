# frozen_string_literal: true

#  FuturesDB service
class FuturesDB < Sinatra::Base
  post "/#{API_VER}/member/create/?" do
    result = MemberCreate.call(request.body.read)

    if result.success?
      MemberRepresenter.new(result.value).to_json
    else
      ErrorRepresenter.new(result.value).to_status_response
    end
  end

end
