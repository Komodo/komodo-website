(function() {

    var logger = console;

    this.init = function(customLogger)
    {
        logger = customLogger;
    }

    this.run = function(params, done)
    {
        logger.info("======================================================================");
        logger.info("Running job " + __dirname);
        logger.info("======================================================================");
        logger.debug(params);

        var exec = require('child_process').exec;
        var commands = [
            "npm prune",
            "npm install",
            "bower prune",
            "bower install",
            "docpad clean"
        ];

        // Deploy to github pages if this is the production branch, otherwise
        // just compile it locally
        if (params.branch == "production")
        {
            commands.push("docpad deploy-ghpages --env static --silent");
        }
        else
        {
            commands.push("docpad generate --env qa --silent");
            commands.push("rm -Rf " + __dirname + "/live");
            commands.push("mv " + __dirname + "/out " + __dirname + "/live");
        }

        var runCommand = function(index)
        {
            if ( ! (index in commands)) return done();

            var source = "source " + __dirname + "/../komodo-website-" + params.branch + ".env && ";
            var command = commands[index];
            logger.info("Executing " + command);
            exec('cd "' + __dirname + '" && ' + source + command, function(err, stdo, stde)
            {
                if (err) return done(err);
                logger.debug("Result: " + stdo + stde + "\n");
                runCommand(++index);
            });
        }

        runCommand(0);
    };
    
    this.schedule = function(branch, cron, deploy)
    {
        logger.info("Scheduling deployment for " + __dirname + " : " + branch);

        var doDeploy = function()
        {
            deploy({
                name: 'komodo-website-' + branch,
                path: __dirname,
                repository: 'komodo-website',
                branch: branch
            });
        };

        // Deploy latest version every 3 hours
        new cron('0 */3 * * *', function(){
            logger.info('Running scheduled deploy for ' + __dirname);
            doDeploy();
        }, null, true);

        doDeploy();
    };

}).apply(module.exports);
