HTTP
  Hypertext Transfer Protocol
  application layer protocol
  is a Request Responce Protocol
    client makes a request
    server responds
    messages are strings of a specified format
DNS
  Domain Name System
  distributed database that converts domain names to IP addresses
  DNS Servers hold the databases
    is a worldwide network hierarchy of servers

Process of navigating to a website
  enter URL
  browser creates a HTTP request
  If browser has IP address for the domain name stored
    sends request with that IP
  Else
    DNS request is made to Domain Name System to get the IP
  HTTP request is sent over internet to the IP address
  Remote server accepts request and responds
  response is sent back over the internet to client network interface
  network interface passes the request to the browser
  browser interprets response to displsay web page

Statelessness
  each request/response pair is independent from the previous one
  protocols can be stateless
  HTTP is stateless
    a brand new request must be made to retrieve info every time

URL
  Uniform Resource Locator
  URI
    Uniform Resourece Identifier
  Parts -- http://www.website.com:80/home?item=book
    Scheme
      http, https, ftp, mailto, git
      generally will be a protocol but in a URL it is known as a scheme
    Host
      www.website.com
      tells the client where the resource is located
    Port
      :80
      only if using a port other than the default
      port 80 is default
    Path
      /home/thing
      shows what part of the resource is being requested
      can point to a specific resource
        example.com/place/thing.html
    Query String
      ?item=book
      Query string components -- example.com?item=book&name=trevor
        ? -- reserved cahracter that marks the start of the query string
        item=book -- parameter name/value pair
        & -- reserved character used between multiple parameters
      have a maximum length
      all info is visable therefore unsecure
  URL encoding
    some characters need to be escaped to be added to a URL
    unsafe because they can be missrepresented
      `% space ! + # < > { } [ ] ~` and others
    unsafe because they have a special meaning in URLs
      `/ ? : @ &`

HTTP Requests
  HTTP Request Method
    GET, POST, ...
    tells the server what action to perform on the resource
    all requests get a response
      can be an error
      rarely a request will Time Out and get no response
  GET Requests
    made by clicking links or entering URL in a browser
    can add query strings to a GET request
    Used to retrieve a resource
    redirects
      if HTML is sent back it may referece another resource
      Browsers will send another GET request to retrieve that resource
  POST Request
    used to send or submit data to a server
    can send larger and more sensitive data to a server
    how login information is sent
    Information sent in the HTTP Body
  Response
    raw HTTP data sent back from a server

HTTP Headers
  allow client and server to send additional info during request/response
  sent by plain text
  colon-separated name value pairs
    request-method: GET
    content-type: text/html
  fields
    host -> Domain name of server (www.website.com)
    accept-language -> list of acceptable languages
    user-agent -> string that identifies the client
    connection -> type of connection the client would prefer

Response
  raw HTTP data sent back by a server
  Status Code
    3 digit number that signifies the statuse of the request
      200 -> Ok
      302 -> Found - requested resouse has changed, usually redirects
      404 -> Not Found
      500 -> Internal Server Error
  Status Text
    deisplays a discription of the status code
  302 Found
    Location field will have new location in the response header
    used when redirecting to log in
      redirects to login page
      URL has return_to in query string
  Responce Headers
    Content-Encoding -> type of encoding used on the data
    Server -> name of the server
    Location -> notifies client of a new location of the resource
    Content-Type -> type of data the response contains

Stateful Web Applications
  HTTP is stateless - Does not hold onto info after request/responce cycle
    every request is unaware or any other request
    statefullness is simulated using cookies, sessions, and AJAX
  Sessions
    session identifier
      unique token that server sends to client
      client adds it to following requests so server can identify it
      expires in a relatively short time
  Cookies
    piece of data sent by server and stored on the client
    stored in the browser and contain session information
    sent by server after first request
      client sends cookie with future requests
      server uses cookie data to identify
    set-cookie
      in response header from server
    cookie (header)
      in future requests from client
  AJAX - Asyncronous JavaScript and XML
    lets browsers issue and process requests without a full page refresh
    Callback
      logic executed after a certain event
      can be triggered when a responce is returned
        to update HTML of a page

Security
  Packet Sniffing
    intercepting packets to find session IDs
  HTTPS - Secure HTTP
    all requests and responses are incripted before being transported
    TLS - Transport Layer Security
      cryptographic protocol
      uses cirtificates to communicate with remote servers
      exchange security keys before data encryption happens
    SSL - Secure Socket Layer
      old security protocol before TLS
  Same-Origin Policy
    unrestricted interaction btwn resources orininating from same origin
    Origin
      a URL's scheme, hostname, and port
        EXAMPLE: http://website.com/page1
          same origin: http://website.com/page2
          different:
            https://website.com/page2      -- different scheme
            http://website.com:1234/page2  -- different port
            http://othersite.com/page2     -- different host
    some cross-origin requests are allowed:
      linking, redirects, form submittions, embedding(css, scripts, images)
    restricts when resource is accesed programaticaly
      XMLHttpRequest, fetch
    CORS - Cross-Origin Resource Sharing
      allows interactions that would normally be restricted
      adds HTTP headers
  Session Hijacking
    attacker gets session ID
    countermeasures
      resetting sessions
        logging in makes any old session IDs invalid
        force a re-login when accessing sensitive areas
      Expiration times on session IDs
        narrows time an attacker has when they get a session ID
      use HTTPS
  XSS - Cross-Site Scripting
    when a site allows users to input HTML or JavaScript
      such as in a comment box
      <textarea>
    browser will interpret the code that was entered and execute it
      attacker can enter code that grabs session IDs
    Server should sanitize input
      remove tagged input
        <script>...
      dissallow HTML and JavaScript altogether
      use Markdown or some other format
    escapte all user input
      replace HTML Characters with ASCII characters

