# urequire-rc-teacup-js2html

## Introduction

[uRequire](http://urequire.org) [ResourceConverter](http://urequire.org/resourceconverters.coffee) that converts each `*.teacup` to a `*.js` module, automagically importing *all* teacup exported keys (i.e. no need to `{head, body, div, ..} = teacup`).

Also it decorates your exported function with a `renderable`, which never harms!

Each template is treated as a Module (that exports a simple function) and can participate like all other modules in the bundle.

*Note: To convert them to '.html' use [`urequire-rc-teacup-js2html`](http://npmjs.org/package/urequire-rc-teacup-js2html).*


## Install

```
$ npm install urequire-rc-teacup-js --save
```

## Authoring

Assuming file `'persons.teacup'`

```coffeescript
    module.exports = (names)-> ul -> li name for name in names
```

and `'home.teacup'` can be

```coffeescript
    persons = require './persons'

    module.exports = (greeting = "Mars...! Its seems no args were passed.")->
      doctype 'html'
      html ->
        body ->
          div '#Hello, ',-> greeting
          persons ['John', 'Maria']
```

Note there's no need to import any teacup keys as vars, eg `div = teacup.div` etc - they are automagically imported by `urequire-rc-teacup-js`

### How to use (in your [uRequire config](http://urequire.org/masterdefaultsconfig.coffee))

To convert all `.teacup` files in your 'path' a corresponding `.js` module in your 'dstPath'.

```javascript
    resources: [ ..., `teacup-js` , ...]
```

To convert them all to `.html` as well, use [`teacup-js2html`](http://npmjs.org/package/urequire-rc-teacup-js2html).

```javascript
    resources: [ ..., `teacup-js` , 'teacup-js2html'...]
```

## License

The MIT License

Copyright (c) 2014 Agelos Pikoulas (agelos.pikoulas@gmail.com)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
