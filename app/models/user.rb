class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.sectoken = auth.credentials.token
      user.sectoken_expires_at = Time.at(auth.credentials.expires_at)
     # user.save!
    end
  end
end