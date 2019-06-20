module QuestionsHelper
  def question_header(options)
    if params[:action] == 'new'
      title = options[:test].title
      "Create New #{title} Question"
    elsif params[:action] == 'edit'
      title = options[:question].test.title
      "Edit #{title} Question"
    end
  end
end
