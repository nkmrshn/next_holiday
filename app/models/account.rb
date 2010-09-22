class Account < ActiveRecord::Base
  validates :twitter_id,      :presence => true,
                              :uniqueness => true
  validates :access_token,    :presence => true,
                              :uniqueness => true
  validates :access_verifier, :presence => true,
                              :uniqueness => true
end
