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

  def all_tests_category(badge)
    return false unless @test_passage.passed
    return false unless badge.rule_value == @test.category.title
    # badge_category = @user.badges.where(rule_value: @test.category.title)
    # return false if badge_category.exists?

    ids_test_category = Test.all.ids_test_category(@test.category.title)
    (ids_test_category - ids_test_successful).empty?
  end

  def first_attempt_ok(_badge)
    return false unless @test_passage.passed
    TestPassage.where(user_id: @user.id, test_id: @test.id).count == 1
  end

  def all_tests_level(badge)
    return false unless @test_passage.passed
    return false unless badge.rule_value.to_i == @test.level
    # badge_level = @user.badges.where(rule_value: @test.level)
    # return false if badge_level.exists?

    ids_test_level = Test.where(level: @test.level).ids
    (ids_test_level - ids_test_successful).empty?
  end
end
