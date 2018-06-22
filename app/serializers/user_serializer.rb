class UserSerializer < ApplicationSerializer
  attributes :id,:username,:email,:role,:last_login
end
