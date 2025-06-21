# Building Middlemac on Your Machine

## The Script Way

In the project folder, `helpbook_source`, there is a shell script called `install_middlemac.sh`
which installs the `rbenv` utility, Ruby version 3.4.4, and Middlemac. If you haven't done any
of those steps already, you may be best off just opening a Terminal window and running the script.

## The Manual Way

If you'd rather do the typing yourself (maybe you already have `rbenv`, maybe you are just particular
about what scripts you run on your machine), here are the steps the script goes through, with commentary
about what each step is doing, so you can do whatever is appropriate for your situation. (For example,
the script clones the Middlemac source into a subdirectory of `/tmp`, but maybe you want to do that
somewhere else.)

These instructions assume you already have [Homebrew] installed.

First, you should install `rbenv`, which is a tool to let you have multiple versions
of ruby installed on your computer, and to let you specify which version to use in a
given directory. Not only is this handy for ruby development, but it lets you try making
local modifications to gems without screwing up your whole system. As someone
who doesn't normally program in ruby, I find this especially helpful.

`brew install rbenv`

Next, install ruby. There are precisely 1.2 gazillion releases of ruby, and only a person
who develops primarily in ruby (so, not me) can keep them straight. There is a sort of
master list at [ruby-lang.org] and that's how one can discover what the state of a particular
version is (current, outdated, end-of-life).

`rbenv install 3.4.4`

For subsequent steps we'll need to be sure that any gems we install are put in the right
place. If a build step spawns a new shell, then that shell is likely to use whatever the
*default* version of ruby is, rather than whatever version of ruby invoked the shell.

`rbenv global 3.4.4`

Okay, and now we need to build and then install Middlemac. First, grab the source that has
been modified to work with ruby 3:

`git clone git@github.com:sbeitzel/middlemac.git`

`cd middlemac`

`bundle install` - this will download and install all the dependencies Middlemac needs.

`rake install` - this will actually install Middlemac to your Ruby installation.

Next, go back to the `helpbook_source` directory and run `bundle install`, which will make sure
that the helpbook's dependencies are all installed and ready.

At this point, you should be ready to go!

[Homebrew]: https://brew.sh
[ruby-lang.org]: https://www.ruby-lang.org/en/downloads/releases/
