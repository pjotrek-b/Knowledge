<!--
XML XSDs
-->

# Schema Validation
## What are XSDs?

  * [XML Schema Definition](https://en.wikipedia.org/wiki/XML_Schema_(W3C))
  * Defines structure of an XML data layout (=schema).
  * In machine readable form.
  * Used for automated metadata schema validation.


# W3C Example

```
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:html="http://www.w3.org/1999/xhtml"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform
                                http://www.w3.org/1999/XSL/Transform.xsd
                                http://www.w3.org/1999/xhtml
                                http://www.w3.org/1999/xhtml.xsd">
```

<small>
Or see: [EFG (European Film Gateway) XSD](https://efgproject.eu/downloads/efg_3.2.07_fixed.xsd)
</small>
