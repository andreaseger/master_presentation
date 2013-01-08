class Presentation < Sinatra::Base

  configure do
    set :root, File.dirname(__FILE__)
    set :public_folder, File.join(root, 'public')
    register Sinatra::Reloader
  end

  def wrap_markdown_slides slide
    <<-EOF
    <section data-markdown><script type="text/template">
      #{slide}
    </script></section>
    EOF
  end

  def wrap_html_slides slide
    <<-EOF
    <section>
      #{slide}
    </section>
    EOF
  end

  def slides
    files = Dir[File.join(settings.root, 'slides', '*')]
    sections = files.sort.map{|e| e.split('/').last}.group_by{|e| e.match(/slide(\d{2})(-(\d+))?/)[1] }.values
    sections.map do |section|
      content = section.map do |file|
                  path = File.join(settings.root, 'slides', file)
                  case File.extname(file)
                  when '.md'
                    wrap_markdown_slides IO.read(path)
                  when '.html'
                    wrap_html_slides IO.read(path)
                  end
                end.join("\n")
      if section.size > 1
        wrap_html_slides content
      else
        content
      end
    end.join("\n")
  end

  get '/' do
    erb :index
  end
end