class Member < ActiveRecord::Base
  MEMBERS_COLUMNS = [ :name, :comment, :birthday, :hometown, :bloodtype, :university, :ability, :hobby, :merit, :demerit, :favorite_word, :language, :favorite_language, :favorite_tool, :editor, ]
  attr_accessible *MEMBERS_COLUMNS
  attr_accessor :password, :password_confirmation

  validates :password, presence: { on: :create }, confirmation: { allow_blank: true }

  has_many :entries, dependent: :destroy

  def password=(val)
  	if val.present?
  	  self.hashed_password = BCrypt::Password.create(val)
  	end
  	@password = val
  end

  class << self
    def authenticate(name, password)
  	  member = find_by_name(name)
  	  if member && member.hashed_password.present? && BCrypt::Password.new(member.hashed_password) == password
  	  	member
  	  else
  	  	nil
  	  end
  	end
  end
end
