# Description:
#   Start up some wonderful chats with conversation starters
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot chat - Start a new conversation
#
# Author:
#   GantMan

module.exports = (robot) ->
  robot.respond /chat/i, (msg) ->
    msg.http("http://chatoms.com/chatom.json?Normal=1&Fun=2&Philosophy=3&Out+There=4&Love=5&Personal=7")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).text
