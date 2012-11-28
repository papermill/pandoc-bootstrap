% pandoc-bootstrap
% Max F. Albrecht
% 2012-08-30


Description
===========

**WORK IN PROGRESS**: template to integrate HTML5 output from [pandoc](https://github.com/jgm/pandoc) with [twitter's bootstrap](https://github.com/twitter/bootstrap)

Examples
=======

- [This Document](#)
- [`Pandoc`'s README](./Pandoc-README.generated.html)
- [Book by Marie Curie: "Untersuchungen über die radioaktiven Substanzen" (1904)](curie-radio-de.html) (*in German*)  
  (Source is [Project Gutenberg](http://www.gutenberg.org/ebooks/37945) and was rewritten in pandoc-markdown by [rwst](https://github.com/rwst/book-curie-radio-de))

TODO/IDEAS
==========

(not everything here is in the scope of this repo and will move downstream later)

- Handling of non-linear content (via Tooltips etc)
    - Footnotes
    - Biliographic Information ("References")
- Handling of reader-functions
    - Bookmarks 
    - Notes
- User-configuration of all this
- (local) store ephemeral reader data (from functions, but also reading position)
- Opt-in visual fixes to aid legasthenics
- test markup to work with screen readers etc (W*ARIA)
- smart scrollbars with content lenght/structure hints!
    - js library: <http://christophercliff.com/sausage/>
    - rationale: <http://www.chrisnorstrom.com/2011/02/creation-introducing-the-content-aware-scrollbar-ui/>