class NoticeMailer < ApplicationMailer
  def send_mail(mail_title,mail_content,group_users)
  @mail_title = mail_title
  @mail_content = mail_content
  mail to: group_users.pluck(:email), subject: mail_title
  end
end
