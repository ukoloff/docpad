ul ->
  for page in @getCollection("pages").toJSON()
    li
      class: if page.id is @document.id then 'active' else 'inactive'
      ->a
        href: page.url
        page.title
