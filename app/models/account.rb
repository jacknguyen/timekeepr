class Account < ActiveRecord::Base
  RESTRICTED_SUBDOMAINS = %w(www) #%w allows us to specifiy an array of strings without using delimiters

  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' }, #regex to allow us to get rid of characters we don't want
                        #\A and \Z denotes beginning and end of string
                        #\w any character a-z & any number and ( _ )
                        #\- to allow -
                        #+ will allow any number of \w \- to appear
                        #make the whole thing case insensitive
                          exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' } #validate the subdomain chosen is not in a list of restricted subdomains


  before_validation :downcase_subdomain

  private

  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
end
