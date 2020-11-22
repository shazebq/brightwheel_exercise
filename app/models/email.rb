class Email
  include ActiveModel::Model

  def self.attr_list
    [:to, :to_name, :from, :from_name, :subject, :body]
  end

  def self.attr_list_without(attr)
    attr_list - attr
  end

  attr_accessor *attr_list
  validates *attr_list_without([:body]), presence: true, length: { maximum: 100 }
  validates :body, length: { maximum: 1000 }
  validates :to, :from, format: { with: URI::MailTo::EMAIL_REGEXP }

  def after_validation_callback
    # remove html tags
    self.body = ActionController::Base.helpers.strip_tags(self.body)
  end
end
