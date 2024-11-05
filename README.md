# Omakub

Turn a fresh Ubuntu installation into a fully-configured, beautiful, and modern web development system by running a single command. That's the one-line pitch for Omakub. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakub is an opinionated take on what Linux can be at its best.

Watch the introduction video and read more at [omakub.org](https://omakub.org).

## To run this fork instead of original Omakub:

_Thank you [@rmacklin](https://github.com/rmacklin) for [providing this way](https://github.com/basecamp/omakub/pull/259#issuecomment-2334347180) of running specific commit of Omakub_

~~~sh
export OMAKUB_REF=e18af2759d689918eb9f9476597c0e2b287ce199
wget -qO- "https://raw.githubusercontent.com/basecamp/omakub/${OMAKUB_REF}/boot.sh" | bash
~~~

If you want to have [VS Code as an optional choice](https://github.com/DoppioJP/omakub-arm/tree/some-moved-to-optional) (like me), then use this commit:

~~~sh
export OMAKUB_REF=0b8363f58b027057ee61b1e5db6fb89333bdd45a
wget -qO- "https://raw.githubusercontent.com/basecamp/omakub/${OMAKUB_REF}/boot.sh" | bash
~~~

## Contributing to the documentation

Please help us improve Omakub's documentation on the [basecamp/omakub-site repository](https://github.com/basecamp/omakub-site).

## License

Omakub is released under the [MIT License](https://opensource.org/licenses/MIT).

## Extras

While omakub is purposed to be an opiniated take, the open source community offers alternative customization, add-ons, extras, that you can use to adjust, replace or enrich your experience.

[⇒ Browse the omakub extensions.](EXTENSIONS.md)
