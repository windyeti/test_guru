class AwardsService
  def initialize(test)
    @test_passage = test
    @test = test.test
    @user = test.user
  end

  def check
    Badge.all.select { |badge| send("#{badge.rule}", badge) }
  end

  def ids_test_successful
    @user.test_passages.where(passed: true).map(&:test).map(&:id)
  end

  def ids_test_successful_within(time_range)
    @user.test_passages.where(passed: true, created_at: time_range).map(&:test).map(&:id)
  end

  def ids_successful(badge_rule_value, badge)
    if badge_rule_value.exists?
      time_create_last_badge_category = BadgeUser.where(user_id: @user.id, badge_id: badge.id).last.created_at
      ids_test_successful_within(time_create_last_badge_category..Time.current)
    else
      ids_test_successful
    end
  end

  def all_tests_category(badge)
    return false unless @test_passage.passed
    return false unless badge.rule_value == @test.category.title
    badge_category = @user.badges.where(rule_value: @test.category.title)

    ids_test_category = Test.all.ids_test_category(@test.category.title)
    (ids_test_category - ids_successful(badge_category, badge)).empty?
  end

  def first_attempt_ok(_badge)
    return false unless @test_passage.passed
    TestPassage.where(user_id: @user.id, test_id: @test.id).count == 1
  end

  def all_tests_level(badge)
    return false unless @test_passage.passed
    return false unless badge.rule_value.to_i == @test.level
    badge_level = @user.badges.where(rule_value: @test.level)

    ids_test_level = Test.where(level: @test.level).ids
    (ids_test_level - ids_successful(badge_level, badge)).empty?
  end
end
