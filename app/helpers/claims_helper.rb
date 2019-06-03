module ClaimsHelper
  def status_class(a_claim)
    case a_claim.status
    when 'new' then 'success'
    when 'in progress' then 'primary'
    when 'finished' then 'info'
    when 'reclaimed' then 'warning'
    end
  end
end
