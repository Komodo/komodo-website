module.exports = ({server, docpad}) ->

    return unless docpad.getEnvironment() == "qa"

    server.all '/hooks/push', (req, res, next) ->

        try
            rootPath = docpad.config.rootPath

            exec = require('child_process').exec

            payload = JSON.parse req.body.payload
            branch = payload.ref.split("/")[2]

            docpad.log "info", "Received github push event for branch: " + branch

            if branch == 'production'

                exec 'git pull', {cwd: rootPath + "/../deploy"}, (error, stdout, stderr) ->
                    if error
                        docpad.log "error", error
                        docpad.log "stderr", stderr
                    else
                        cmd = 'docpad clean && docpad deploy-ghpages --env static > deploy.log'
                        exec cmd, {cwd: rootPath + "/../deploy"}


            else if branch == 'master'
                exec 'git pull', {cwd: rootPath}, (error, stdout, stderr) ->
                    if error
                        docpad.log "error", error
                    else
                        docpad.action('clean') # TODO: Figure out how we can do this without a clean under docpad-server
                        docpad.action('server generate')

        catch e
            docpad.log "error", e.message

        res.redirect("/")
