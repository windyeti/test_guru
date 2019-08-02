module BadgesHelper
  def header(badge)
    case badge.rule
    when 'all_tests_category' then ("ВСЕ ТЕСТЫ<br>#{badge.category}").html_safe
    when 'first_attempt_ok' then ('ЗА ТЕСТ<br>С ПЕРВОГО РАЗА').html_safe
    when 'all_tests_level' then ('ВСЕ ТЕСТЫ<br>ОДНОГО УРОВНЯ').html_safe
    end
  end

  def image(badge)
    "/badges/badge_#{badge.image}.png"
  end
end
