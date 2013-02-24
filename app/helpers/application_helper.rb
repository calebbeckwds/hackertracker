module ApplicationHelper
  def datepicker(type, field, value)
    begin
      dateval = value.strftime('%Y-%m-%d')
    rescue
      dateval = Time.now.to_date.strftime('%Y-%m-%d')
    end

    "<div class='input-append datepicker'>
       <input name='#{type}_#{field}' data-format='yyyy-MM-dd' type='text' value='#{value}'></input>
       <span class='add-on'><i data-time-icon='icon-time' data-date-icon='icon-calendar'></i></span>
     </div>".html_safe
  end
end
