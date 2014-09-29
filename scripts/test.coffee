# Description:
#   Reboot XBMC
#
# Dependencies:
#    None
#
# Configuration:
#    None
#
# Commands:
#   hubot xbmc reboot <xbmc hostname> - Reboots the specified xbmc host
#
# Notes:
#   None
# Author:
#   Tom Robinson (tomo0)

module.exports = (robot) ->
  robot.respond /xbmc reboot (.+)$/i, (msg) ->
    spawn = require('child_process').spawn

    xbmchost=escape(msg.match[1])
    command = "ssh root@#{xbmchost} reboot"

    msg.send "Sending reboot command to #{xbmchost} ..."

    @exec = require('child_process').exec

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr
