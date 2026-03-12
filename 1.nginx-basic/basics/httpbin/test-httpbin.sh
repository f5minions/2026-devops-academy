
##### NGINX API Gw Test ###
# Basic Request Tests
# Simple GET
curl http://10.1.1.11:30080/get

# Rate Limiting test with no violation 
for i in {1..10}; do   curl -i -s -o /dev/null -w "%{http_code}\n" http://10.1.1.11:8000/get;   sleep 1; done

# Rate Limiting test with violation 
for i in {1..10}; do   curl -i -s -o /dev/null -w "%{http_code}\n" http://10.1.1.11:8000/get;  done








############################## Direct HTTPBIN API Test ################################
# Basic Request Tests
# Simple GET
curl http://10.1.20.22:30080/get

# Add query params
curl "http://10.1.20.22:30080/get?name=Gilmour&role=singer"

# Custom headers
curl -H "X-Demo: test" http://10.1.20.22:30080/headers


#POST / PUT / PATCH / DELETE
# POST with form data
curl -X POST -F "username=admin" -F "password=secret" http://10.1.20.22:30080/post

# POST with JSON body
curl -X POST http://10.1.20.22:30080/post \
     -H "Content-Type: application/json" \
     -d '{"item":"car","price":5000}'

# PUT
curl -X PUT http://10.1.20.22:30080/put -d "updated=data"

# PATCH
curl -X PATCH http://10.1.20.22:30080/patch -d "patched=data"

# DELETE
curl -X DELETE http://10.1.20.22:30080/delete

# Request Inspection
# Show your IP
curl http://10.1.20.22:30080/ip

# Show headers you send
curl http://10.1.20.22:30080/headers

# Show user-agent only
curl -A "MyCustomClient/1.0" http://10.1.20.22:30080/user-agent

# Auth & Cookies
# Basic auth (user=foo, pass=bar)
curl -u foo:bar http://10.1.20.22:30080/basic-auth/foo/bar

# Set a cookie
curl http://10.1.20.22:30080/cookies/set/sessionid/12345

# Get cookies
curl http://10.1.20.22:30080/cookies

# Delays & Status Codes
# Delay response by 3 seconds
curl http://10.1.20.22:30080/delay/3

# Return a specific status code
curl -i http://10.1.20.22:30080/status/404
curl -i http://10.1.20.22:30080/status/500

# Other Endpoints
# Stream N lines of JSON
curl http://10.1.20.22:30080/stream/5

# Random UUID
curl http://10.1.20.22:30080/uuid

# Gzip response
curl --compressed http://10.1.20.22:30080/gzip

# Deflate response
curl http://10.1.20.22:30080/deflate

# Anything endpoint (echoes request back)
curl -X POST http://10.1.20.22:30080/anything -d "test=data"
