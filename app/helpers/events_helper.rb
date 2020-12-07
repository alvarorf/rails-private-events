module EventsHelper

  def event_process_links(event)
    return unless logged_in? && event.creator == current_user

    content_tag(:div, class: 'text-left') do
      content_tag(:span) do
        link_to 'Edit', edit_event_path(event), class: 'btn btn-outline-info mr-3'
      end +
        content_tag(:span) do
          link_to 'Delete', event_path(event),
                  class: 'btn btn-outline-danger', method: :delete, data: { confirm: 'Are you sure?' }
        end
    end
  end

  def current_event
    @current_event ||= Event.find(session[:user_id]) if current_user
  end

end
