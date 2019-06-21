module QuestionsHelper
  def question_header(options)
    if options[:test].nil?
      title = options[:question].test.title
      "Edit #{title} Question"
    else
      title = options[:test].title
      "Create New #{title} Question"
    end
  end
end
