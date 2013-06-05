class Url < ActiveRecord::Base
  validates :url, :presence => true, :format => { :with => URI::regexp("http"), 
                  :message => "THAT'S NOT A REAL WEBSITE. Only valid URLs allowed."}
  validates_uniqueness_of :url, :message => "Already taken. Unique URLs only."

  before_save   :make_shorty

  def make_shorty
    self.shorturl = SecureRandom.hex(3)
  end
end
