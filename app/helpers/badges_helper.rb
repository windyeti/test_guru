module BadgesHelper
    def rules_titles
    Badge::RULES.map { |rule| [ I18n.t("admin.badge.#{rule}"), rule ] }
  end

  def rules_images
    Badge::IMAGES.map { |image| [ I18n.t("admin.badge.#{image}"), image ] }
  end

  def header(badge)
    I18n.t("admin.badge.#{badge.rule}")+ ' ' +"#{badge.rule_value}"
  end

  def image(badge)
    "/badges/badge_#{badge.image}.png"
  end

  def list_rule_value
    Category.all.pluck(:title) + Test.all.pluck(:level).uniq
  end
end
