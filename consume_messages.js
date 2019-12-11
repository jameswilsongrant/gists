const RedisSMQ = require("rsmq");
const rsmq = new RedisSMQ( {host: "192.168.99.102", port: 6379, ns: "rsmq"} );

function handleMessage() {
    rsmq.popMessage({ qname: "myqueue" }, function (err, resp) {
        if (err) {
            console.error(err)
            return
        }

        if (resp.id) {
            console.log("Message received and deleted from queue", resp)
        } else {
            console.log("No messages for me...")
        }
    });
};

setInterval(handleMessage, 1000);