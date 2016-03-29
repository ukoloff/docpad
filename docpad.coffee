# DocPad Configuration File
# http://docpad.org/docs/config

path = require 'path'

#@poweredByDocPad = false

@templateData =
  site:
    title: "My Website"

  getPreparedTitle: ->
    if @document.title
      "#{@document.title} | #{@site.title}"
    else
      @site.title

@collections =
  pages: ->
    @getCollection "html"
    .findAllLive isPage:true
    .on "add", (model) ->
      model.setMetaDefaults layout:"default"

@plugins =
  less:
    parseOptions:
      paths: path.join __dirname, "node_modules"
  copy:
    fonts:
      src: '../node_modules/font-awesome/fonts'
      out: 'fonts'
  webpack:
    entry:
      the: './the'
