# SASS Stylesheet schema

Stylesheet and organisation pattern for a Rails Application.

## Installation

```bash
mkdir -p app/assets/stylesheets/modules
mkdir -p app/assets/stylesheets/partials
mkdir -p app/assets/stylesheets/sections
mkdir -p app/assets/stylesheets/vendor

touch app/assets/stylesheets/modules/_all.scss
touch app/assets/stylesheets/partials/_base.scss
touch app/assets/stylesheets/unit-project.css.scss
```

## Basics

Read the linked resources in the Docs & Credits section at the bottom.

Goal is to define stylesheet packages. These files are prefixed with `unit-`. All files with this prefix will be precompiled by rails.

```ruby
# config/environments/produciton.rb
# Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
config.assets.precompile += [ /^unit-\w+.(css|js)$/ ]
```


## Demo and Usage

Example Directory Tree.

```bash
stylesheets/
├── modules/
│   ├── _all.scss
│   ├── _clearfix.scss
│   └── _mixins.scss
│
├── partials/
│   ├── _alerts.scss
│   ├── _base.scss
│   ├── _body.scss
│   ├── _forms.scss
│   ├── _modifiers.scss
│   ├── _pagination.scss
│   └── _typography.scss.scss
│
├── sections/
│   └── _pricelist.scss
│
├── vendor/
│   └── _normalize.scss
│
└── unit-project.css.scss
```


```scss
//# app/assets/stylesheets/modules/_all.scss
// import all modules
// REMEMBER modules output no css
@import "mixins";
```


```scss
// Use bourbon for css3 helper
@import "bourbon";


//# app/assets/stylesheets/partials/_base.scss
// place global project variables here
/* -------------------------------------------------------- variables */
// $brand-primary:         #ED6D39;
/* -------------------------------------------------------- */


// import modules at the end
@import "modules/all"
```


```scss
//# app/assets/stylesheets/unit-project.css.scss
// optional normalize
// @import "vendor/normalize";


// modules and variables
@import "partials/base";


// frameworks
@import "bootstrap";


// only used partials
@import "partials/alerts",
		"partials/body",
		"partials/forms",
		"partials/modifiers",
		"partials/pagination",
		"partials/typography";


// only used sections
@import "sections/pricelist";


// 3rd party vendor
// @import "vendor/colorpicker";
```


## Docs & Credits

* http://thesassway.com/beginner/how-to-structure-a-sass-project
* http://pivotallabs.com/structure-your-sass-files-with-import/
