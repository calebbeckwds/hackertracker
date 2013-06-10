module TicketsHelper
  def class_for_ticket(ticket)
    if ticket.bug?
      'btn-warning'
    elsif ticket.feature?
      'btn-info'
    elsif ticket.suggestion?
      'btn-success'
    end
  end
end
