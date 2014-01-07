atheme-services Cookbook
========================

This cookbook installs and configures the [Atheme IRC services](http://atheme.net/atheme.html).

Requirements
------------
This cookbook has only been tested under **Ubuntu 12.04**, and makes some Ubuntu-specifc assumptions about filesystem conventions and init methods. It should be fairly easy to add support for other distributions, and I'd welcome patches to do so.

#### cookbooks
- `ark`

Attributes
----------
Atheme has a hideous number of configuration variables, that can be modified via this cookbook. Rather than listing them all here, I suggest taking a look through the [default attributes](https://github.com/reidab/chef-atheme-services/blob/master/attributes/default.rb) and the [config file template](https://github.com/reidab/chef-atheme-services/blob/master/templates/default/atheme.conf.erb).

Usage
-----
#### atheme-services::default

Include `atheme-services` in your node's `run_list` and configure at will.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

License and Authors
-------------------

Copyright (C) 2014 Reid Beels

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
