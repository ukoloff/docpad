Block = (name, fn)=>
  z = @getBlock name
  z = fn.call z if 'function'==typeof fn
  raw z.toHTML()

(tag "!DOCTYPE", true) html: true
html ->
  head ->
    title @getPreparedTitle()
    Block "meta"
    meta
      name: "viewport"
      content: "width=device-width, initial-scale=1"
    Block "styles", ->
      @add ["/the.css", "/styles/style.css"]
  body ->
    raw @partial "navbar"
    div class: 'container-fluid', ->
      raw @partial "img"

      h1 @document.title
      raw @content

    Block "scripts", ->
      @add ["/vendor/jquery.js", "/vendor/bootstrap.min.js", "/scripts/script.js"]
