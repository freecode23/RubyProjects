require "open-uri"
require "nokogiri"

require_relative "view"

class Controller
  MEDIUM_BASE_URL = "https://medium.com/".freeze

  def initialize(repo)
    @repo = repo
    @view = View.new
  end

  def index
    list
  end

  def create
    path = @view.ask_user_for(:path)
    file = open("#{MEDIUM_BASE_URL}#{path}").read
    doc = Nokogiri::HTML(file)
    title = doc.search("h1").first.text
    paragraphs = doc.search(".sectionLayout--insetColumn > .graf--p")
    content = paragraphs.map(&:text).join("\n\n")
    author = doc.search(".postMetaHeader a.ds-link").first&.text
    post = Post.new(path: path, title: title, content: content, author: author)
    @repo.add(post)
    list
  end

  def show
    list
    index = @view.ask_user_for_index
    post = @repo.find(index)
    @view.display_content(post)
  end

  def mark_as_read
    list
    index = @view.ask_user_for_index
    @repo.mark_as_read(index)
    list
  end

  private

  def list
    posts = @repo.all
    @view.display(posts)
  end
end
