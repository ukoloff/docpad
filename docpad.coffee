# DocPad Configuration File
# http://docpad.org/docs/config

values = (map)->
  v for k, v of map

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
      paths: ["#{__dirname}/node_modules"]
