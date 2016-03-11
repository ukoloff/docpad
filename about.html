(tag "!DOCTYPE", true) html: true
html ->
  head ->
    title @getPreparedTitle()
    raw @getBlock("meta").toHTML()
    raw @getBlock("styles").add(["/styles/style.css"]).toHTML()
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
    raw @getBlock("scripts").add(["/vendor/jquery.js", "/scripts/script.js"]).toHTML()
