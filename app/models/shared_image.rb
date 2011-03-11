class SharedImage < ActiveRecord::Base
  attr_accessor :data_url
  
  has_attached_file :data, :styles => { :large => "300x300>", 
                                        :thumb => "100x100>" },
                                    :storage => :s3, 
                                    :s3_credentials => {
                                     :access_key_id => S3[:key],
                                     :secret_access_key => S3[:secret]
                                    },
                                    :bucket => S3[:bucket],
                                    :path => "shared_images/:id/:style.:extension",
                                    :default_url => "/images/s3/shared_images/default_:style.png"
  
  def save_from_data_url
    self.data = parse_data_url
    self.save
  end 
  
  protected
    def parse_data_url
      file = File.new('public/uploaded.png', 'r+')
      file.write(Base64.decode64(self.data_url.gsub(/^data(.*)base64\,/, '')))
      file
    rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
    end
end
