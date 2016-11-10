https://github.com/notablemind/jupyter-nodejs

# Jupyter NodeJS notebook docker
This is a kernel for [Jupyter](http://github.com/ipython/ipython), previous unknow as ipython notebook

Get it while it's hot! or view the [example notebook](http://nbviewer.ipython.org/gist/jaredly/404a36306fdee6a1737a)

Credit to **notablemind** [jupyter-nodejs](https://github.com/notablemind/jupyter-nodejs)

## How to run it
```bash
mkdir notebooks
docker run -v $(pwd)/notebooks:/notebook -p 8888:8888 jupyter-nodejs
```

Jupyter will run in notebooks folder under your current directory. Then just visit http://localhost.8888

![image](https://cloud.githubusercontent.com/assets/112170/7268108/70cade4e-e882-11e4-95e7-8a7375b3b888.png)

## Supported features:

- tab-completion (both for variables and **paths**)
- error reporting
- magics! The available extensions can be configured via `package/config.js`

## BabelJS Magic for es6+ goodness
`%load_ext babel` and then

```javascript
%%babel
class Awesome {
  constructor() {
    console.log('yeah!')
  }
}
```

**Hovever:** `import ...` syntax *doesn't work* because of [live bindings](https://github.com/ModuleLoader/es6-module-loader/wiki/Circular-References-&-Bindings#es6-circular-references--bindings) foo, so just use `require()` normally and all will be well.

## Clojurescript compilation via a [himera](https://github.com/fogus/himera) server

`%load_ext clojurescript http://himera-emh.herokuapp.com` and then

```clojure
%%clojurescript
(clojurey goodness)
```
