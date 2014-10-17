teacup = require 'teacup'

compiler = null

module.exports = [
  '$~teacup-js'

  """
  uRequire ResourceConverter that converts `*.teacup` to `*.js`,
  automagically importing teacup exported keys (i.e. no need to `{head, body, div, ..} = teacup`).
  """

  ['**/*.teacup']

  (t)->
    compiler or= require @options.compiler || 'coffee-script'

    compiler.compile """
      teacup = require 'teacup'

      {#{@options.tags || (k for k of teacup).join ','}} = teacup

      #{t.converted}

      module.exports = teacup.renderable module.exports
    """

  '.js'
]
