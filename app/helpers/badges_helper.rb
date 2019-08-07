module BadgesHelper
  def header(badge)
    case badge.rule
    when 'all_tests_category' then ("#{I18n.t('admin.badge.all_tests_category')} #{badge.rule_value}")
    when 'first_attempt_ok' then ("#{I18n.t('admin.badge.first_attempt_ok')}")
    when 'all_tests_level' then ("#{I18n.t('admin.badge.all_tests_level')} #{badge.rule_value}")
    end
  end

  def image(badge)
    "/badges/badge_#{badge.image}.png"
  end

  def list_rule_value
    Category.all.pluck(:title) + Test.all.pluck(:level).uniq
  end
end
