# E4 Discourse Component - navigation bar
Places the a navigation bar below the header.

Style is purposely bland and meant to be overridden. Here is an example of how that can be done

```
.e4-container {
  background-image: linear-gradient($e4-color-gradient-medium, $e4-color-gradient-light, $e4-color-gradient-medium);
  border: 1px solid $e4-color-hardborder;
  border-radius: 10px;
}

.e4-button {
  > li {
    > a {
      background-image: linear-gradient($e4-color-gradient-medium, $e4-color-gradient-dark);
      color: $e4-color-darkred;
      border: 1px solid $e4-color-softborder !important;
      border-radius: 10px;
      text-transform: uppercase;
      box-sizing: border-box;

      &:hover {
        border: 1px solid $e4-color-hardborder !important;
        color: $e4-color-darkred !important;
      }
    }
  }
}
```
Gives a classic E4 flavour. Add the overridden style to a theme or component.
