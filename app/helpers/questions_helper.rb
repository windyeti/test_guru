module QuestionsHelper
  def question_header(options)
    if options[:question].persisted?
      title = options[:question].test.title
      "#{options[:edit_header]} #{title}"
    else
      title = options[:test].title
      "#{options[:new_header]} #{title}"
    end
  end
end
