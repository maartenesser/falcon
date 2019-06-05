module ClaimsHelper
  def status_class(a_claim)
    case a_claim.status
    when 'new' then 'primary'
    when 'in progress' then 'warning'
    when 'finished' then 'success'
    when 'reclaimed' then 'secondary'
    end
  end
end
