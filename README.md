Stylus:轻而易举实现 CSS 前缀和CSS reset 
-----

[![](https://img.shields.io/github/issues/jaywcjlove/AutoPrefixCSS.svg)](https://github.com/jaywcjlove/AutoPrefixCSS/issues) [![](https://img.shields.io/github/forks/jaywcjlove/AutoPrefixCSS.svg)](https://github.com/jaywcjlove/AutoPrefixCSS/network) [![](https://img.shields.io/github/stars/jaywcjlove/AutoPrefixCSS.svg)](https://github.com/jaywcjlove/AutoPrefixCSS/stargazers) [![](https://img.shields.io/github/release/jaywcjlove/AutoPrefixCSS.svg)](https://github.com/jaywcjlove/AutoPrefixCSS/releases)

Break free from CSS prefix hell!  
摆脱CSS前缀地狱！   

CSS3 每个浏览器都有私有属性例如 `-moz` 代表firefox浏览器私有属性、`-ms` 代表IE浏览器私有属性、`-webkit` 代表chrome、safari私有属性，在 `CSS3` 标准还在没有定稿的时候，`CSS3` 中有很多属性都还处于实验性阶段，各个浏览器都针对暂行的规范草稿根据自己的理解做了 `CSS3` 新特性实现，但因为规范尚未成熟和定稿，某些描述的不清晰或是处理逻辑的不完整可能导致一些目前的实现在日后被修改。暂时使用带前缀的属性比如 `-webkit-transform` 的初衷，是为了以后即便 `transform` 的最终实现与目前不同，你原来写的 `-webkit-transform` 还是可以正常工作。所以浏览器现在开始越来越倾向于直接实现最终属性而抛弃前缀了。老的浏览器可能不支持 `transform` ，所以我们通常为了兼容各个版本的浏览器，`-webkit-transform` 和 `transform` 两个属性都加上了。   


- -webkit- (Google Chrome & Safari)
- -khtml- (Konqueror)
- -moz- (Mozilla Firefox)
- -ms- (Internet Explorer)
- -o- (Opéra)
- syntaxe normale

# 下载

```shell
$ bower install AutoPrefixCss #下载
$ bower info AutoPrefixCss #查看详情
```

# 初衷

网上有很多js实现的自动添加 CSS前缀的哦，例如[autoprefixer](https://github.com/postcss/autoprefixer) 、[prefixfree](http://leaverou.github.com/prefixfree/)。  

* `stylus` 的出现感觉添加这种前缀不用太麻烦了。
* 只生成CSS，浏览器直接渲染CSS，不用通过js生成CSS在渲染。


# 使用必备条件

需要安装 `node.js` 和 `stylus` ，还得学会使用 `stylus`， [stylus github](https://github.com/stylus/stylus)， [stylus教程](http://jslite.io/2015/04/27/stylus%E8%8F%9C%E9%B8%9F%E5%85%A5%E9%97%A8%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95/)

# Usage

## reset.styl
只需要将 `reset.styl` 到您的项目，然后引用 `@import('reset.styl')` ，然后在你所引用的`.styl` 中调用下面任何一个方法：

 - global-reset() # 所有标签重置不包括HTML5新标签重置
 - nested-reset() # 嵌套标签重置
 - reset-font()
 - reset-box-model()
 - reset-body()
 - reset-table() # 表格重置
 - reset-table-cell() # 表格单格重置
 - reset-html5() # HTML5新标签重置

例子：  

```
@import('reset.styl')
global-reset()
```


## 自动添加CSS后缀
只需要将 `vendor.styl` 到您的项目，然后引用 `@import('vendor.styl')` ，然后你在你的 `styl` 文件中正常使用 `stylus` 语法就好了。效果如下例子：

### opacity
adds opacity filter for IE

```stylus
@import('vendor.styl')
body
    opacity:0.5
```

生成：

```css
body {
  opacity: 0.5;
  -khtml-opacity: 0.5;
  -moz-opacity: 0.5; /* old Mozilla */
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50); /*old IE */
}
```