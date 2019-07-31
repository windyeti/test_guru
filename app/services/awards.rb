class Awards
  def initialize(test)
    @test = test
    @user = test.user
  end
  def check
    @user.badges << Badge.find_by(rule_id: 1) if passage_category_backend && !@user.badges.include?(Badge.find_by(rule_id: 1))
    @user.badges << Badge.find_by(rule_id: 2) if first_attempt_ok
    passage_test_level.times { @user.badges << Badge.find_by(rule_id: 3) }

  end

  def passage_category_backend
    ids_exist_test_backend = ids_test_category_backend
    ids_passage_test = @user.tests.pluck(:id)
    (ids_exist_test_backend - ids_passage_test).empty?
  end

  def first_attempt_ok
    ids_passage_test = @user.tests.pluck(:id)
    !ids_passage_test.include?(@test.id)
  end

  def passage_test_level
    BadgeUser.where(user_id: @user.id).each { |b| b.delete if Badge.find(b.badge_id)[:rule_id] == '3' }
    count = 0
    ids_passage_test = @user.tests.pluck(:id)
    ids_level_test = {}
    Test.all.pluck(:level).uniq.each do |level|
      ids_level_test[level] = Test.where(level: level).pluck(:id)
    end
    ids_level_test.map do |_key, value|
      count +=1 if (value - ids_passage_test).empty?
    end
      count
  end

  def ids_test_category_backend
    Test.all.ids_test_category("Backend")
  end
end
