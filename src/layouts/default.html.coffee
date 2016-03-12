Block = (name, fn)=>
  z = @getBlock name
  z = fn.call z if 'function'==typeof fn
  raw z.toHTML()

(tag "!DOCTYPE", true) html: true
html ->
  head ->
    title @getPreparedTitle()
    Block "meta"
    Block "styles", ->
      @add ["/styles/style.css"]
  body ->
    raw @partial "img"
    raw @partial "links"

    h1 @document.title
    raw @content
    Block "scripts", ->
      @add ["/vendor/jquery.js", "/scripts/script.js"]
