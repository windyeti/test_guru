module BadgesHelper
  RULE_TITLE = {
    'all_tests_category'=> I18n.t('admin.badge.all_tests_category'),
    'first_attempt_ok'=> I18n.t('admin.badge.first_attempt_ok'),
    'all_tests_level'=> I18n.t('admin.badge.all_tests_level')
  }

  RULE_IMAGE = {
    'gold'=> I18n.t('admin.badge.gold'),
    'silver'=> I18n.t('admin.badge.silver'),
    'bronze'=> I18n.t('admin.badge.bronze')
  }

  def header(badge)
    # замена case
    # это работает на 50% -- при переключении языка нет правильного перевода
    # "#{I18n.t('admin.badge.rule', text: RULE_TITLE[badge.rule] )} #{badge.rule_value}"

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

  def rule_to_invert_array(rule)
    rule.map { |key, value| [ value, key ] }
  end
end
