class Presentation < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(root, 'public')

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
    files = DIR[File.join(root, 'slides', '*')]
    files.sort.map do |file|
      case File.extname(file)
      when '.md'
        wrap_markdown_slides IO.read(file)
      when '.html'
        wrap_html_slides IO.read(file)
      end
    end.join("\n")
  end

  def slides
    Dir.glob(File.join(root, 'slides', '*')).map { |f| IO.read(f) }.join("\n")
  end

  get '/' do
    erb :index
  end
end