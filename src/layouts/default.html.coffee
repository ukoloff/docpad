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
      @add ["/the.css", "/styles/style.css"]
  body -> div class: 'container-fluid', ->

    nav class: "navbar navbar-inverse navbar-static-top", ->
      div class: "container-fluid", ->
        div class: "navbar-header", ->
          button
            type: "button"
            class: "navbar-toggle collapsed"
            data:
              toggle: "collapse"
              target: "#navbar"
            ->
            span class: "sr-only", 'Toggle navigation'
            span class: "icon-bar" for i in [1..3]
          a
            class: "navbar-brand"
            'Hello!'

    raw @partial "img"
    raw @partial "links"

    h1 @document.title
    raw @content
    Block "scripts", ->
      @add ["/vendor/jquery.js", "/scripts/script.js"]
