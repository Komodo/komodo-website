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
            "git submodule update --init",
            "cd " + __dirname + "/src/resources && git pull origin master",
            "cd " + __dirname + "/plugins/resources && npm install",
            "cd " + __dirname + "/plugins/vimeofeed && npm install",
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

        var source = __dirname + "/../komodo-website-" + params.branch + ".env && ";
        var environment = process.env;
        environment.PATH = environment.PATH + ":/usr/local/bin:/usr/bin:~/.nvm/v0.10.25/bin/";

        var runCommand = function(index)
        {
            if ( ! (index in commands)) return done();

            var command = commands[index];
            logger.info("Executing " + command);
            exec(source + command, {
                maxBuffer: 1000*1024,
                env: environment,
                cwd: __dirname
            },
            function(err, stdo, stde)
            {
                if (err) return done(err);
                logger.info("Result: " + stdo + stde + "\n");
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
