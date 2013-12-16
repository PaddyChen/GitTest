class Product < ActiveRecord::Base
  validates_presence_of :title,:img_url
  validates_uniqueness_of :title

  validates_length_of :description,:minimum => 5,:maxmum=>500
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent

  validates_format_of :img_url,
                        :with=> %r{\.(gif|jpg|jpeg|png)$}i,
                        :multiline => true,
                        :message=>"img_url must be a url for gif,jpg,jpeg,png"

  private
  def price_must_be_at_least_a_cent
    errors.add(:price,"price must be at least 0.01")  if price.try(:<,0.01)
  end

end
