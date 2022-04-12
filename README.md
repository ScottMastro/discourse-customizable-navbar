# E4 Discourse Component - navigation bar
Places the a navigation bar below the header.

Style is purposely bland and meant to be overridden. Here is an example of how that can be done

```
.e4-container {
  background-image: linear-gradient(#e6e6e6, #ffffff, #e6e6e6);
  border: 1px solid #645f6e;
  border-radius: 10px;
}

.e4-button {
  > li {
    > a {
      background-image: linear-gradient(#e6e6e6, #c9c9c9);
      color: #a30000;
      border: 1px solid #868686 !important;
      border-radius: 10px;
      text-transform: uppercase;

      &:hover {
        border: 1px solid #645f6e !important;
        color: #a30000 !important;
      }
    }
  }
}
```
Gives a classic E4 flavour. Add the overridden style to a theme or component.
