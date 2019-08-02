class Badge < ApplicationRecord
  RULE_TITLE = [['Все тесты категории', 'all_tests_category'],
                 ['С первой попытки', 'first_attempt_ok'],
                 ['Все тесты одного уровня', 'all_tests_level']]

  RULE_IMAGE = %w[gold silver bronze]

  has_many :badge_users
  has_many :users, through: :badge_users

  validates :rule, :image, presence: true
  validates :rule, uniqueness: { scope: :category}

  def self.check(test)
    badges = []
      if test.successful?
        all.each do |badge|
          badges << badge if badge.send("#{badge.rule}", test)
        end
      end
    badges
  end

  def ids_test_successful(test)
   test.user.test_passages.map do |t|
    t.test_id if t.successful? && t.user_id == test.user.id
    end
  end

  def all_tests_category(test)
    return if User.joins(:badges)
                  .where("category = ? AND user_id = ? AND rule = 'all_tests_category' ", "#{category}", "#{test.user.id}").exists?
    ids_test_category = Test.all.ids_test_category("#{category}")
    (ids_test_category - ids_test_successful(test)).empty?
  end

  def first_attempt_ok(test)
    TestPassage.where("test_id = ? AND user_id = ?", test.test_id, test.user_id).count == 1
  end

  def all_tests_level(test)
    badge_level_already_count = User
                      .joins(:badges).where("rule = 'all_tests_level' AND user_id = ?", "#{test.user.id}").count
    count = 0
    ids_level_test = {}
    Test.all.pluck(:level).uniq.each do |level|
      ids_level_test[level] = Test.where(level: level).pluck(:id)
    end
    ids_level_test.each do |_key, value|
      count +=1 if (value - ids_test_successful(test)).empty?
    end
    count > badge_level_already_count
  end
end
