# PDF Links

Add " (PDF)" text after links that go to PDFs. If file size specified as data attribute, use that too.

## Usage

* copy `pdf_links.scss` to `app/assets/stylesheets[/partials]/_pdf_links.scss`

## Documentation


```html
<p>Watch out for the <a href="some.pdf">PDF bomb</a> here!</p>
<!-- Watch out for the PDF bomb (PDF) here! -->
```

```html
<p>Watch out for the <a href="some.pdf" data-size="2 MB">PDF bomb</a> here!</p>
<!-- Watch out for the PDF bomb (PDF, 2 MB) here! -->
```


## Credits

* http://css-tricks.com/snippets/css/signify-pdf-bombs/
