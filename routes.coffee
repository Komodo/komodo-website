module.exports = ({server, docpad}) ->

    return unless docpad.getEnvironment() == "qa"

    server.all '/hooks/push', (req, res, next) ->

        try
            rootPath = docpad.config.rootPath

            exec = require('child_process').exec

            payload = JSON.parse req.body.payload
            branch = payload.ref.split("/")[2]

            if branch == 'master'

                exec 'git pull', {cwd: rootPath + "/../deploy"}, (error, stdout, stderr) ->
                    if error
                        docpad.log "error", error
                    else
                        cmd = 'docpad clean && docpad deploy-ghpages --env static'
                        exec cmd, {cwd: rootPath + "/../deploy"}, (error, stdout, stderr) ->
                            if error
                                docpad.log "error", error
                            else
                                docpad.log "info", stdout


            else if branch == 'development'
                exec 'git pull', {cwd: rootPath}, (error, stdout, stderr) ->
                    if error
                        docpad.log "error", error
                    else
                        docpad.action('clean') # TODO: Figure out how we can do this without a clean under docpad-server
                        docpad.action('server generate')

        catch e
            docpad.log "error", e.message

        res.redirect("/")
