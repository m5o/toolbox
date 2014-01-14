# Password strength meter

Password score/strength indicatior. Display password scoring with log output (debug output).

## Installation

* copy `password_meter.js` to `app/assets/javascripts/password_meter.js`
* copy `password_meter.scss` to `app/assets/stylesheets[/partials]/_password_meter.scss`

## Usage

```html
<div class="password-meter">
	<div class="password-meter-bar-wrapper">
		<div class="password-meter-bar">&nbsp;</div>
		<span class="password-meter-bar-section section-1"></span>
		<span class="password-meter-bar-section section-2"></span>
		<span class="password-meter-bar-section section-3"></span>
	</div>
	<div class="password-meter-bar-text">Passwortsicherheit</div>
	<% if Rails.env.development? %>
		<pre class="password-meter-log"><!--//--></pre>
	<% end %>
</div>
```


* If necessary update element name in `password_meter.js`

```js
$("#user_password").keyup…
```
