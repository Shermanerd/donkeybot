# Description:
#   Inspect the data in redis easily
#
# Commands:
#   hubot show users - Display all users that hubot knows about
#   hubot show storage - Display the contents that are persisted in the brain


Util = require "util"

module.exports = (robot) ->
  robot.respond /show storage$/i, (msg) ->
    isAdmin = (process.env.HUBOT_AUTH_ADMIN or "").toLowerCase() is msg.message.user.name.toLowerCase()
    if isAdmin
      output = Util.inspect(robot.brain.data, false, 4)
      msg.send output
    else
      msg.send "Yeah, I'd rather not."

  robot.respond /show users$/i, (msg) ->
    isAdmin = (process.env.HUBOT_AUTH_ADMIN or "").toLowerCase() is msg.message.user.name.toLowerCase()
    unless isAdmin
      msg.send "Nope."
      return

    response = ""

    for own key, user of robot.brain.data.users
      response += "#{user.id} #{user.name}"
      response += " <#{user.email_address}>" if user.email_address
      response += "\n"

    msg.send response

