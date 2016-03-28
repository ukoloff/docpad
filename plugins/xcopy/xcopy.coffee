path = require 'path'
ncp = require 'ncp'

module.exports = (BasePlugin) ->
  BasePlugin.extend
    name: "xcopy"

    config:
      raw:
        # src: 'raw'  # Default = key
        skip: false   # Can be disabled...

    writeAfter: ->
      docpad = @docpad
      cfg = docpad.getConfig()
      for k, v of @getConfig() when not v.skip
        src = path.resolve cfg.srcPath, v.src or k
        dst = path.resolve cfg.outPath, v.dst or ''
        docpad.log "info", "X-Copying #{k}..."
        ncp src, dst
