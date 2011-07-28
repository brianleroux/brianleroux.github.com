var httputil = require('nodeunit').utils.httputil
,   async    = require('async')
,   app      = require('./../app')


// the only thing MORE gross than this would be no tests...
exports['test audio API'] = function(test) {
    httputil(
        app.cgi(),

        function(server, client) {
            async.series([

                function (ok) {
                    client.fetch('GET', '/', {}, function (resp) {
                        //test.equal('Hello World', resp.body);
                        test.equal(200, resp.statusCode);
                        ok();
                    });
                },

                function (ok) {
                    client.fetch('GET', '/audio', {}, function (resp) {
                        test.equal(0, JSON.parse(resp.body).length);
                        ok();
                    });
                },
                
                function (ok) {
                    client.fetch('POST', '/audio', {}, function (resp) {
                        test.equal(500, resp.statusCode);
                        ok();
                    });
                },

                function (ok) {
                    server.close();
                    test.done();
                    ok();
                }

            ]);
        }
    );
};
