class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :cart

end
