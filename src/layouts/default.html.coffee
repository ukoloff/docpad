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
    img src: "/images/logo.gif"

    ul ->
      for page in @getCollection("pages").toJSON()
        li
          class: if page.id is @document.id then 'active' else 'inactive'
          ->a
            href: page.url
            page.title

    h1 @document.title
    raw @content
    Block "scripts", ->
      @add ["/vendor/jquery.js", "/scripts/script.js"]
