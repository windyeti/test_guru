module BadgesHelper
  def header(badge)
    case badge.rule_id
    when '1' then ('ВСЕ ТЕСТЫ<br>BACKEND').html_safe
    when '2' then ('ЗА ТЕСТ<br>С ПЕРВОГО РАЗА').html_safe
    when '3' then ('ВСЕ ТЕСТЫ<br>ОДНОГО УРОВНЯ').html_safe
    end
  end

  def image(badge)
    "/badges/badge#{badge.image_id}.png"
  end
end
