const RedisSMQ = require("rsmq");
const rsmq = new RedisSMQ( {host: "192.168.99.102", port: 6379, ns: "rsmq"} );

rsmq.createQueue({ qname: "myqueue" }, function (err, resp) {
	if (err) {
		//console.error(err)
		// return
	}

	if (resp === 1) {
		console.log("queue created")
    }
    
    rsmq.sendMessage({ qname: "myqueue", message: "Hello World "}, function (err, resp) {
        if (err) {
            console.error(err)
            return
        }
    
        console.log("Message sent. ID:", resp);
        rsmq.quit()
    });

});