coffee = require 'coffee-script'
teacup = require 'teacup'

module.exports = [
  '$~teacup-js'

  """ """

  ['**/*.teacup']

  (t)->
    ###
    @options : NOT IMPLEMENTED
      language: String, default 'coffee-script', can also be 'coco', 'LiveScript' etc
      commonCode: boolean (false), if true the imported vars (eg 'div', 'body' etc)
                  become [`commonCode`](http://urequire.org/masterdefaultsconfig.coffee#bundle.commoncode)
                  when 'combined' template is used.
    ###
    coffee.compile """
      {#{(k for k of teacup).join ','}} = require 'teacup'

      #{t.converted}

      module.exports = renderable module.exports
    """

  '.js'
]