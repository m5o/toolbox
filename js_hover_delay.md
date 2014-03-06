# JavaScript Hover Delay

Start Hover action after Delay. Useful for sidebar navigations.

## Installation

* copy `js_hover_delay.js` to `app/assets/javascripts/hover_delay.js`


## Example

Dummy list

```html
<aside>
    <ul>
        <li><a href="#">Link</a></li>
        <li><a href="#">Link</a></li>
        <li>
            <a href="#">
                hover delay
                <ul class="mboxmenu">
                    <li><a href="#">Link</a></li>
                    <li><a href="#">Link</a></li>
                    <li><a href="#">Link</a></li>
                </ul>
            </a>
        </li>
        <li><a href="#">Link</a></li>
        <li><a href="#">Link</a></li>
    </ul>
</aside>
```

```css
aside .mboxmenu {
    display: none;
    position: absolute;
    border: 1px solid red;
    margin-left: 40px;
}
```

## Documentation

* http://codepen.io/anon/pen/xwKGc
