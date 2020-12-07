module ApplicationHelper
  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action.'
    redirect_to login_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def displaylist(list)
    var = content_tag(:div) do
    end

    list.each do |event|
      var +=
        content_tag(:div, class: 'w-100 col-3') do
          content_tag(:div) do
            link_to image_tag('event.jpeg', alt: 'Logo', class: 'w-100'), event
          end +
            content_tag(:p) do
              "#{event.title} #{event.date}"
            end
        end
    end

    var
  end

  def displaylist_user(list)
    var = content_tag(:div) do
    end

    list.each do |user|
      var +=
        content_tag(:div, class: 'w-100 col-2') do
          content_tag(:div) do
            link_to gravatar_image_tag(user, size: 200), user
          end +
            content_tag(:p) do
              user.username.to_s
            end
        end
    end

    var
  end

end
