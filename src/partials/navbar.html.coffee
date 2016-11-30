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
        -> i class: "fa fa-paw"
        ' Hello!'
    div id: "navbar", class: "collapse navbar-collapse", ->
      ul class: "nav navbar-nav", ->
        for page in @getCollection("pages").toJSON()
          li
            class: if page.id is @document.id then 'active' else 'inactive'
            ->a
              href: page.url.replace /index[.]html$/, ''
              page.title
        li -> a
          href: '/dbs'
          'DBS'
