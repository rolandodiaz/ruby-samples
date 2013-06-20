require "cuba"
require "cuba/render"
require "ohm"

require_relative "lib/sesion"
require_relative "lib/comment"

Ohm.connect


Cuba.plugin Cuba::Render

Cuba.settings[:render][:options] = {
    default_encoding: Encoding.default_external,
    escape_html: true,
}

Cuba.use Rack::Static,
    root: "public",
    urls: ["/js", "/css", "/images"]

Cuba.define do
  on "sesiones/crear" do
    on get do
      res.write(view("create", sesion: Sesion.new))
    end

    on post do
      sesion = Sesion.new(
        title: req.POST["title"],
        ponente: req.POST["ponente"],
        description: req.POST["description"],
      )

      sesion.save

      if sesion.new?
        res.write(view("create", sesion: sesion))
      else
        res.redirect("/sesiones/#{sesion.id}", 302)
      end
    end
  end

  on "sesiones/:id" do |id|
    sesion = Sesion[id]

    on get do
      res.write(view("sesion", sesion: sesion, comment: Comment.new))
    end

    on post do
      comment = Comment.new(
        user: req.POST["user"],
        rating: req.POST["rating"],
        body: req.POST["body"],
        sesion_id: id,
      )

      comment.save

      if comment.new?
        res.write(view("sesion", sesion: sesion, comment: comment))
      else
        res.redirect("/sesiones/#{id}", 302)
      end
    end
  end

  on root do
    sesiones = Sesion.all
    res.write(view("home", sesiones: sesiones))
  end
end
