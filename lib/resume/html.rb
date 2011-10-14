module Resume
  class HTMLBackend
    class << self
      def render r
        md = MarkdownBackend.render r
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                           :autolink => true, :space_after_headers => true)
        body = markdown.render md
        template = File.open(File.dirname(__FILE__) + "/templates/template.html.erb").read
        Erubis::Eruby.new(template).evaluate(:about => r.about, :body => body)
      end
    end
  end
end
