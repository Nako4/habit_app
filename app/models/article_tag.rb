class ArticleTag
  include ActiveModel::Model
  attr_accessor :title, :output, :action, :tag_name, :user_id

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :output, length: { maximum: 400 }
  end

  def save(current_user)
    article = Article.create!(title: title, output: output, action: action, user_id: current_user.id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ArticleTagRelation.create!(article_id: article.id, tag_id: tag.id)
    habit = Habit.create!(action: action, user_id: current_user.id)
  end
end
