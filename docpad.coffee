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
  xcopy:
    fonts:
      src: path.join require.resolve('font-awesome/package'), '..', 'fonts'
      dst: 'fonts'
    katex:
      src: path.join __dirname, "node_modules/katex-all/dist/fonts"
      dst: 'fonts'
  webpack:
    entry:
      the: './the'
