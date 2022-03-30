module UsersHelper
  def day_ago(n)
    n == 0 ? "今日" : "#{n}日前"
  end
end
