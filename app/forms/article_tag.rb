class ArticleTag
  include ActiveModel::Model
  attr_accessor :title, :output, :action, :tag_name, :user_id, :tag_id, :article_id

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :output, length: { maximum: 400 }
  end

  # レコードに値があるかないかでcreateかupdateかに分岐させる
  delegate :persisted?, to: :article

  def initialize(attributes = nil, article: Article.new)
    @article = article
    attributes ||= default_attributes
    super(attributes)
  end

  def save(tag_list)

    ActiveRecord::Base.transaction do
      @article.update(title: title, output: output, action: action, user_id: user_id)

      current_tags = @article.tags.pluck(:tag_name) unless @article.tags.nil?
      old_tags = current_tags - tag_list
      new_tags = tag_list - current_tags

      old_tags.each do |old_name|
        @article.tags.delete Tag.find_by(tag_name: old_name)
      end

      new_tags.each do |new_name|
        article_tag = Tag.find_or_create_by(tag_name: new_name)
        @article.tags << article_tag
        article_tag_relation = ArticleTagRelation.where(article_id: @article.id, tag_id: article_tag.id).first_or_initialize
        article_tag_relation.update(article_id: @article.id, tag_id: article_tag.id)
      end

    end
  end

  def to_model
    article
  end

  private

  attr_reader :article, :tag

  def default_attributes
    {
      title: article.title,
      output: article.output,
      action: article.action,
      tag_name: article.tags.pluck(:tag_name).join(',')
    }
  end
end
