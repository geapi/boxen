# boxen
boxen script to set up my mac

### to get going:

- install Xcode (run git command in terminal to trigger)
- update IntelliJ version [here](https://github.com/geapi/boxen/blob/master/modules/people/manifests/geapi/applications.pp)
- make sure this fork of boxen is [relatively close to the upstream](https://github.com/boxen/our-boxen/blob/master/docs/faq.md#q-how-do-you-upgrade-your-boxen-from-the-public-our-boxen)
- get boxen locally for the install

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone <location of my new git repository> /opt/boxen/repo
cd /opt/boxen/repo
./script/boxen
```



### After boxen is done

- check that all apps from [here](https://github.com/geapi/boxen/blob/master/modules/people/manifests/geapi/applications.pp) are installed.

Then install more:
- [dropbox](https://www.dropbox.com/downloading)
- [google music](https://play.google.com/music/listen?u=0#/manager)
- [adobe cloud](http://www.adobe.com/creativecloud/desktop-app.html)
- [jing](https://www.techsmith.com/download/jing/)
- [omni outliner pro](https://www.omnigroup.com/omnioutliner), there is also a copy on g-drive
- [ynab](http://classic.youneedabudget.com/)
- office
- [zoom.us](https://zoom.us/download#client_4meeting)
- [private internet access](https://www.privateinternetaccess.com/pages/client-support/)
- Quicken 2007 (in g-drive)
- [Sonos App](http://www.sonos.com/en-us/controller-app)


### manual set-up
*  for modifications to the boxen repo clone it into workspace
    * make changes there 
    * push
    * pull with the one in `/opt/boxen/repo`
    * re-run `./script/boxen` there

* Install via AppStore
  * Things
  * Divvy (enable access: 'System Preferences' :  'Security & Privacy' : 'Privacy' : 'Accessibility', add it to allowd apps)
  * Slack

* change the machine name
	* in ’System Preferences’ -> ‘sharing’
	* Enable 'Remote Login' & 'Remote Management'
	* run `sudo scutil --set HostName [NewHostNameHere]` on command line

* Machine Hygiene
  * Add login items under Security & Privacy
    * Divvy
    * Dropbox
    * iTerm
  * Start Menu Meter in _System Preferences_ and show the cpu usage as graph
  * Start Chrome, set it as default browser and login

* iTerm > Preferences > Profiles > Default > Text
  	* Regular Font > Change Font > 15pt Monaco
  	* Non-ASCII Font > Change Font > 15pt Monaco

* Finder
	* open preferences
		* under General set _New Finder windows show_ to _USER_HOME
		* in Sidebar, check _pivotal_ under favorites, uncheck _All My Files, iCloud Drive, Documents_
	* add _workspace_ to the side-bar (in an open Finder window you can just drag that in there)

* Open Textmate
  * Preferences -> Terminal -> Install command line tools
  * Preferences -> Project -> Show file browser on: Left side


* Open IntelliJ
	* open a project from workspace
	* in Preferences
		* Appearance & Behavior -> Appearance -> Select Darcula as theme
		* Appearance & Behavior -> System Settings -> Open project in new Window
		* Editor -> General -> Scroll Down
			* Set 'Maximum number of clipboard contents' to 100
			* Set 'Recent File Limit' to 100
		* Editor -> General -> Appearance -> check `show line numbers`

* Open Atom
    * under Preferences -> Packages -> Search for Save, then click on settings for the 'autosave' package and check the box for enable

* Encrypt the harddrive
    * System Preferences -> Security & Privacy -> Turn on FileVault, store the backup key in the google drive



```
cd /opt/boxen/repo
./script/boxen
```

### Distributing

That's enough to get your boxen into a usable state on other machines,
usually.
From there, we recommend setting up
[boxen-web](https://github.com/boxen/boxen-web)
as an easy way to automate letting other folks install your boxen.

If you _don't_ want to use boxen-web, folks can get using your boxen like so:

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone <location of my new git repository> /opt/boxen/repo
cd /opt/boxen/repo
./script/boxen
```

Keep in mind this requires you to encrypt your hard drive by default.
If you do not want to do encrypt your hard drive, you can use the `--no-fde`.

```
./script/boxen --no-fde
```

It should run successfully, and should tell you to source a shell script
in your environment.
For users without a bash or zsh config or a `~/.profile` file,
Boxen will create a shim for you that will work correctly.
If you do have a `~/.bashrc` or `~/.zshrc`, your shell will not use
`~/.profile` so you'll need to add a line like so at _the end of your config_:

``` sh
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
```

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.

## What You Get

This template project provides the following by default:

* Homebrew
* Homebrew-Cask
* Git
* Hub
* dnsmasq w/ .dev resolver for localhost
* rbenv
* Full Disk Encryption requirement
* Node.js 0.8
* Node.js 0.10
* Node.js 0.12
* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.8
* Ruby 2.2.4
* ack
* Findutils
* GNU tar

## Customizing

You can always check out the number of existing modules we already
provide as optional installs under the
[boxen organization](https://github.com/boxen). These modules are all
tested to be compatible with Boxen. Use the `Puppetfile` to pull them
in dependencies automatically whenever `boxen` is run.

### Including boxen modules from github (boxen/puppet-<name>)

You must add the github information for your added Puppet module into your Puppetfile at the root of your
boxen repo (ex. /path/to/your-boxen/Puppetfile):

    # Core modules for a basic development environment. You can replace
    # some/most of these if you want, but it's not recommended.

    github "repository", "2.0.2"
    github "dnsmasq",    "1.0.0"
    github "gcc",        "1.0.0"
    github "git",        "1.2.2"
    github "homebrew",   "1.1.2"
    github "hub",        "1.0.0"
    github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
    github "nginx",      "1.4.0"
    github "nodejs",     "2.2.0"
    github "ruby",       "4.1.0"
    github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
    github "sudo",       "1.0.0"

    # Optional/custom modules. There are tons available at
    # https://github.com/boxen.

    github "java",     "1.6.0"

In the above snippet of a customized Puppetfile, the bottom line
includes the Java module from Github using the tag "1.6.0" from the github repository
"[boxen/puppet-java/releases](https://github.com/boxen/puppet-java/releases)".  The function "github" is defined at the top of the Puppetfile
and takes the name of the module, the version, and optional repo location:

    def github(name, version, options = nil)
      options ||= {}
      options[:repo] ||= "boxen/puppet-#{name}"
      mod name, version, :github_tarball => options[:repo]
    end

Now Puppet knows where to download the module from when you include it in your site.pp or mypersonal.pp file:

    # include the java module referenced in my Puppetfile with the line
    # github "java",     "1.6.0"
    include java

### Hiera

Hiera is preferred mechanism to make changes to module defaults (e.g. default
global ruby version, service ports, etc). This repository supplies a
starting point for your Hiera configuration at `config/hiera.yml`, and an
example data file at `hiera/common.yaml`. See those files for more details.

The default `config/hiera.yml` is configured with a hierarchy that allows
individuals to have their own hiera data file in
`hiera/users/{github_login}.yaml` which augments and overrides
site-wide values in `hiera/common.yaml`. This default is, as with most of the
configuration in the example repo, a great starting point for many
organisations, but is totally up to you. You might want to, for
example, have a set of values that can't be overridden by adding a file to
the top of the hierarchy, or to have values set on specific OS
versions:

```yaml
# ...
:hierarchy:
  - "global-overrides.yaml"
  - "users/%{::github_login}"
  - "osx-%{::macosx_productversion_major}"
  - common
```

### Node definitions

Puppet has the concept of a
['node'](http://docs.puppetlabs.com/references/glossary.html#agent),
which is essentially the machine on which Puppet is running. Puppet looks for
[node definitions](http://docs.puppetlabs.com/learning/agent_master_basic.html#node-definitions)
in the `manifests/site.pp` file in the Boxen repo. You'll see a default node
declaration that looks like the following:

``` puppet
node default {
  # core modules, needed for most things
  include dnsmasq

  # more...
}
```

### How Boxen interacts with Puppet

Boxen runs everything declared in `manifests/site.pp` by default.
But just like any other source code, throwing all your work into one massive
file is going to be difficult to work with. Instead, we recommend you
use modules in the `Puppetfile` when you can and make new modules
in the `modules/` directory when you can't. Then add `include $modulename`
for each new module in `manifests/site.pp` to include them.
One pattern that's very common is to create a module for your organization
(e.g., `modules/github`) and put an environment class in that module
to include all of the modules your organization wants to install for
everyone by default. An example of this might look like so:

``` puppet
# modules/github/manifests/environment.pp

 class github::environment {
   include github::apps::mac

   include ruby::1-8-7

   include projects::super-top-secret-project
 }
```

 If you'd like to read more about how Puppet works, we recommend
 checking out [the official documentation](http://docs.puppetlabs.com/)
 for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)

### Creating a personal module

See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.

### Creating a project module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).

## Binary packages

We support binary packaging for everything in Homebrew, rbenv, and nvm.
See `config/boxen.rb` for the environment variables to define.

## Sharing Boxen Modules

If you've got a Boxen module you'd like to be grouped under the Boxen org,
(so it can easily be found by others), please file an issue on this
repository with a link to your module.
We'll review the code briefly, and if things look pretty all right,
we'll fork it under the Boxen org and give you read+write access to our
fork.
You'll still be the maintainer, you'll still own the issues and PRs.
It'll just be listed under the boxen org so folks can find it more easily.

##upgrading boxen
See [FAQ-Upgrading](https://github.com/boxen/our-boxen/blob/master/docs/faq.md#q-how-do-you-upgrade-your-boxen-from-the-public-our-boxen).

## Integrating with Github Enterprise

If you're using a Github Enterprise instance rather than github.com,
you will need to set the `BOXEN_GITHUB_ENTERPRISE_URL` and
`BOXEN_REPO_URL_TEMPLATE` variables in your
[Boxen config](config/boxen.rb).

## Halp!

See [FAQ](https://github.com/boxen/our-boxen/blob/master/docs/faq.md).

Use Issues or #boxen on irc.freenode.net.
