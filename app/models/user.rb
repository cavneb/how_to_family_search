class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.avatar_url = auth.info.image
      user.dob = Date.strptime(auth.extra.raw_info.birthday, "%m/%d/%Y")
      user.fb_link = auth.extra.raw_info.link
      user.locale = auth.extra.raw_info.locale
      user.timezone = auth.extra.raw_info.timezone
      user.gender = auth.extra.raw_info.gender
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def is_admin?
    uid == '10153754328917564'
  end

end
