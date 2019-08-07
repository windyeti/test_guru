class AwardsService
  def initialize(test)
    @test_passage = test
  end

  def check
    badges = Badge.all.select { |badge| send("#{badge.rule}") }
    return [] unless @test_passage.passed
    badges
  end

  def ids_test_successful
    @test_passage.user.test_passages.where(passed: true).map(&:test).map(&:id)
  end

  def all_tests_category
    badge_category = @test_passage.user.badges.where(rule_value: @test_passage.test.category.title)
    return if badge_category.exists?

    ids_test_category = Test.all.ids_test_category(@test_passage.test.category.title)
    (ids_test_category - ids_test_successful).empty?
  end

  def first_attempt_ok
    TestPassage.where("test_id = ? AND user_id = ?", @test_passage.test.id, @test_passage.user.id).count == 1
  end

  def all_tests_level
    badge_level = @test_passage.user.badges.where(rule_value: @test_passage.test.level)
    return if badge_level.exists?

    ids_test_level = Test.all.where(level: @test_passage.test.level).pluck(:id)
    (ids_test_level - ids_test_successful).empty?

  end
end
