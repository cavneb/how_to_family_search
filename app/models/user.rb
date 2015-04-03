class User < ActiveRecord::Base

  def self.from_omniauth(auth)

    {"id"=>"10153754328917564", "email"=>"cavneb@gmail.com", "first_name"=>"Eric", "gender"=>"male", "last_name"=>"Berry",
      "link"=>"https://www.facebook.com/app_scoped_user_id/10153754328917564/", "locale"=>"en_US", "name"=>"Eric Berry",
      "timezone"=>"-6", "updated_time"=>"2015-02-06T05:27:00+0000", "verified"=>"true", "provider"=>"facebook"}

    where(uid: auth['id']).first_or_initialize.tap do |user|
      user.uid = auth['id']
      user.first_name = auth['first_name']
      user.last_name = auth['last_name']
      user.email = auth['email']
      user.avatar_url = ''
      user.dob = Date.strptime(auth['birthday'], "%m/%d/%Y")
      user.fb_link = auth['link']
      user.locale = auth['locale']
      user.timezone =  auth['timezone']
      user.gender = auth['gender']
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
