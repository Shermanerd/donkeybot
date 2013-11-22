# Donkeybot

This is a customized version of GitHub's Hubot project.

### Dependencies

- Redis
- Ruby/Bundler
- An IRC daemon (I use ngircd)

### Testing Hubot Locally

Make sure you have Redis installed, and your local IRC daemon configured and running.

You'll need to make sure you have Ruby/Bundler installed, then:

    % bundle install

Create a .env file with the environment variables you want to set. At a minimum:

    HUBOT_IRC_SERVER=<ip address>
    HUBOT_IRC_PASSWORD=<pass>
    HUBOT_IRC_ROOMS="#test1,#test2"
    HUBOT_ADMIN_AUTH=<username of admin>

You can test donkeybot by running the following.

    % foreman start

You'll see some start up output about where your scripts come from and a
prompt.

    09:21:17 web.1  | started with pid 42900
    09:21:19 web.1  | TeamCity environment variables not set. Disabling.
    09:21:19 web.1  | [Fri Nov 22 2013 09:21:19 GMT-0600 (CST)] INFO Data for brain retrieved from Redis
    09:21:20 web.1  | donkeybot has joined #test1
    09:21:20 web.1  | donkeybot has joined #test2

Donkeybot at this point has connected to your IRC server and joined the two test channels. Say `donkeybot help` to get a list
of commands, events, and phrases which trigger donkeybot's behavior.

### Scripting

Take a look at the scripts in the `./scripts` folder for examples.
Delete any scripts you think are useless or boring.  Add whatever functionality you
want donkeybot to have. Read up on what you can do with hubot in the [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).

## Adapters

Adapters are the interface to the service you want donkeybot to run on. This
can be something like Campfire or IRC. There are a number of third party
adapters that the community have contributed. Check
[Hubot Adapters][hubot-adapters] for the available ones.

If you would like to run a non-Campfire or shell adapter you will need to add
the adapter package as a dependency to the `package.json` file in the
`dependencies` section.

Once you've added the dependency and run `npm install` to install it you can
then run hubot with the adapter by updating Procfile to change the `-a` flag
value to the new adapter, then:

    % foreman start

[hubot-adapters]: https://github.com/github/hubot/blob/master/docs/adapters.md

## hubot-scripts

There will inevitably be functionality that everyone will want. Instead
of adding it to hubot itself, you can submit pull requests to
[hubot-scripts][hubot-scripts].

To enable scripts from the hubot-scripts package, add the script name with
extension as a double quoted string to the `hubot-scripts.json` file in this
repo.

[hubot-scripts]: https://github.com/github/hubot-scripts

## external-scripts

Tired of waiting for your script to be merged into `hubot-scripts`? Want to
maintain the repository and package yourself? Then this added functionality
maybe for you!

Hubot is now able to load scripts from third-party `npm` packages! To enable
this functionality you can follow the following steps.

1. Add the packages as dependencies into your `package.json`
2. `npm install` to make sure those packages are installed

To enable third-party scripts that you've added you will need to add the package
name as a double quoted string to the `external-scripts.json` file in this repo.

