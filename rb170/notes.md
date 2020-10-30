=========================================================================

170 notes

=========================================================================


Protocols
  system of rules
  define how messages are passed over a network
  address different aspects of communication
    transer of messages between applications - TCP & UDP
    structure of messages - HTTP
  Addressed the same aspect of communication but in different ways
    TCP vs UDP

Router
  Network devices that route network traffic
  gateways into and out of a network

Layered System
  two models
    OSI    - devides layers in terms of the functions they provide
    TCP/IP - devides layers by the scope of communication

        OSI        |    TCP/IP
                  _|_
      Application  |
      Presentation |  Application
      Session     _|_
      Transport   _|_ Transport
      Network     _|_ Internet
      Data Link    |  Link
      Physical    _|_

  lower layers serve higher layers
    data is encapsulated

Protocol Data Unit - PDU
  a block of data transfered over a network
  each layer will use a different name for their PDUs
    Link/Data Link layer has Frames
    Internet/ Network layer has Packets
    Transport has Segments or Datagrams
  PDUs have two or three parts
    Header
      Provides protocol specific metadata about the PDU
      structure will vary for different protocols
        IP Packet header will have source and destination IP addresses
    Data Payload
      the data that the PDU is transfering
      The data payload is the whole PDU of the layer above
    Footer/ Trailer
  structure of PDUs allows for abstraction
    one layer doesn't need to know what the data payload is
    only needs to encapsulate it into it's own PDU

Physical Network
  lowest layer of OSI Model and withing the Link Layer of TCP/IP
  Bandwidth
    How much data can be transfered at once accross a network
    bandwidth received is going to be lowest point on a network
      bnadwidth bottleneck
  Latency
    How long it takes for some data to get from one point to another
    Propagation Delay
      time to travel from sender to receiver
      basically just distance / speed
    Transmission Delay
      Time to travel through links in the system
        routers, switches, and other devices
    Processing Delay
      time to be processed by transmition devices
    Queuing Delay
      time waiting to be processed
  Last Mile Latency
    Most latency comes from the very ends of the transission line
      getting into and out of home network
  Round Trip Time
    time for a signal to be sent, and a responce to be received
  Network Hops
    jumps between Nodes
  Nodes
    stops along a signal's path like routers
  `traceroute` bash command `traceroute google.com`
    show route and latency across network path

Link/Data Link layer
  Protocols at this layer are primarily concerned with identifying devices
  Moves data over network, between devices on it
  interface between the physical network and the logical layers above
  Ethernet Protocol
    Most common protocol for this layer
    Framing
      Ethernet Frames are the PDU
      encapsulate internet/network data to be sent over physical network
      add logical structure to the bianary bits traveling on physical net
        Header has a defined size
          includes desination and source MAC addresses, and other info
        Interframe Gap - IFG
          pause in signal between transmission of frames
  MAC Address
    Every network enabled device has a unique MAC Address

Internet/Network Layer
  Primarily concerned with communication between hosts on different networks
  IP protocol is the dominant protocol at this layer
    IP protocol PDUs are called Packets
    packets:
      header
        Version - IPv4, IPv6
  Primarily concerned with communication between hosts on different networks
  IP protocol is the dominant protocol at this layer
    IP protocol PDUs are called Packets
    packets:
      header
        Version - IPv4, IPv6
        ID, Flags, Fragment Offset -
          If payload is too big, gets broken up. these identify fragments
        TTL - Time to Live
          Max network hops before dropping
        Protocol
          protocol of the data payload
        Checksum - algorithm generated error check value
          destination device makes sure checksum matches
        Source and destination IP addresses
      data payload
        encapsulated data from the Transport layer
        usually TCP Segment or a UDP datagram
  IP Addresses
    IPv4
      32 bits long dvided into 4 sections or 8 bits
      each section, when converted from bianary creates a number in 0..255
    IPv6
      ups the max number of possible addresses
      different header structure, no error checking
      8 sets of hexidecimal characters, each has 16 bits
    logically assigned to devices as they join a network
    defined by a network hierarchy
      overall network is split into subnetworks
        each subnetwork has a range of IP addresses withing it
        a subnetwork could have 123.123.123.0 to 123.123.123.100
      Network Address
        address at the start of the range
        used to specify a network segment
      Broadcast Address
        address at the end of the range
      all addresses between network and broadcast can be assigned to devices
      Networks can have subnetworks to define more tiers in a hierarchy
    Routing
      routers store a routing table
        used to find where a received packet should be routed to

Transport Layer
  Multiplexing
    transmitting multiple signals over a single channel
    Demultiplexing is the oppisite process
    at the physical layer
      a fiberoptic cable sending sygnals at different angles of refraction
      radio waves at different frequencies
  Network Ports
    how multiplexing is applied at the transport layer
    an identifier for a specific process running on a host
    is an integer between 0 and 65535
      0 - 1023
        assigned to common processes like HTTP(80), FTP(20,21), ...
      1024 - 49151
        registered ports - assigned as requested by private entities
        can be assigend to ephemeral ports on the client side
      49152 - 65535
        Dynamic ports (private ports)
        cannot be registered for a specific use
        used for customized services or for allocation as ephemeral ports
    ephemeral port
      a temporary port assigned to a host process by the operatino system
    listening
      a host receving a message on a specific port is listening on that port
    source and destination ports are in header of Transport layer PDU
  Socket
    a communication end point
    combination of IP address and port number
    can be conceptual or implementable
      conceptually a communication end point for inter-process communication
      Implementation involves creating socket objects in a program
        most common implementation is the Berkley Sockets API Model
          defines functions like `bind`, `listen`, `accept`, and `connect`
      Can be implimented as different things
        UNIX socket
          mechanism for communication between processes on the same machine
        Internet socket (TCP/IP socket)
          mechanism for inter-process communication btwn networked processes
    connectionless system
      has IP and Socket number
      processes all incoming information as it arrives to that ip:socket
    Connection-oriented system
      has IP and Socket number
      when a message arrives
        creates new socket object - local IP:socket and sender's IP:socket
      creates a direct connection for that process
        directly from ip:socket of one host to ip:socket of other host
      only listens for messages matching all 4
      Four-tuple
        all four pieces of info in a connection oriented system
          local IP, local socket, destination IP, destination socket
      when a message not matching all in Four-tuple arrives
        original socket picks it up and creates another socket with all four
  Reliability
    lower level protocols are unreliable communication channels
      IP packets get dropped
      no retransmition system
      failed checksums get dropped
    Elements required for reliability
      In order delivery
      error detection - checksum
      handling data loss - retransmitting lost packets
      handling duplication - sequence numbers used to remove duplicates
    Pipelineing
      sending multiple messages without waiting for response
      Window
        maximum number of messages that can be in a pipline
        set by the sender
      More efficient use of bandwidth

  TCP - Transmission Control Protocol
    Connection oriented protocol
    provides reliable data trasnfer
      abstracts away complexity of reliable network communication
    Segments - PDU of TCP
      Header
        Source Port and Destination Port
        Sequence Number and Acknowledgement Number
          used to solve in order delivery, data loss, duplication
        Checksum
        Window Size
          for flow control
        Flags
          Boolean fields
            URG, PSH - importance of data
            SYN, ACK, FIN, RST - establishing and ending connections
      payload
        application layer PDU
    does not send application data until a connection is established
    Three-way Handshake
      uses SYN and ACK flags
        sender sends SYN Segment - TCP segment with SYN flag set to 1
        receiver receives then sends back SYN ACK segment
        sender receives SYN ACK then sends ACK segment
          starts sending data imediately after ACK segment
        connection is established when receiver receives ACK segment
          receiver must wait for ACK before sending any data to sender
      process syncronizes the sequence numbers for the connection
    Connection State
      CLOSED - client
        no connection
      LISTEN - server
        no connection, receiver waits for a SYN segment
      SYN-SENT - client
        no connection, sender has sent SYN segment but hasnt gotten response
      SYN-RECEIVED - server
        no connection, receiver received SYN, sends back SYN ACK segment
      ESTABLISHED
        client - received SYN ACK, sends ACK, then starts sending data
        server - received ACK, connection established, can send data
    Flow Control
      mechanism to prevent sneder from overloading receiver
      receiver buffers data waiting to be processed
      WINDOW
        amount of data a host is willing to accept
        from TCP header
        can change over course of connection
        both sides of a connection tell each other window size
      Congestion Avoidance
        newtorks can only handle so much data
        excess data gets dropped
        routers buffer incoming IP packets but drop them once buffer is full
        TCP reduces window size if lots of retransmission is happening
    TCP Downsides
      latency
        handshake process
        Head-of-Line blocking (HOL)
          one delayed message prevents all that follow from being processed
  UPD - User Datagram Protocol
    does nothing to handle unreliability, flow control, delivery order, ...
      chooses lack of latency over reliability
    conectionless protocol
    Datagram - PDU for a UDP
    Header
      source port
      desination port
      length
      checksum
    application layer may add some of the services TCP has
      UDP becomes a base template that the application layer builds from

Server
  3 primary pieces
    Web server
      responds to requests for static assets
      Files, images, css, javascript, ...
    Application Server
      where more complicated rewuests are handled
      server side code, application and business logic
    Data Store
      consulted by the application server for data
      can be just a file or a store of key/value pairs

URL vs URI
  URI is more general
    a sequence of characters that identifies a resouce
    a URL is a URI
  URL
    identifies a resource and where to find it
    is a subset of URI

Scheme vs Protocol
  Scheme
    is in a URL
    before the ://
    identifies what protocol should be used to access the resource
    refers to a protocol in terms of a family of protocols.
      referrs to `http` rather than `HTTP 1.0` or `HTTP 1.1`
    Within the context of a URI
      a specification for assigning identifiers within that schene
    written in lowercase -- `http`
  Protocol
    the system of rules that defines how the message is transfered
      specific -- `HTTP 1.0` not just `http`
    written in upper case -- `HTTP`

URL and File Path
  URLs used to just represent a location of a resource
    http://website.com/path/to/file.html
  Most of the web is now dynamicly generated
    server combines templates with stored data to produce HTML for http body
      some services use client-side frameworks
        http resopnse will just have data
        client side will process to produce HTML
    the URL is not neccesarily a path to the resource
      logic in the server side determines what to send back
      might have no relation to the server side file structure
      will usually use URL pattern matching

TLS
  Transport Layer Security
  Session layer protocol
  Previously called SSL(Secure Soccet Layer)
  Most recent version is TLS 1.3
  three important services it provies
    Encryption
      encoding a message so only those with means to decode can read it
    Authentication
      verifies the identity of a party in the message exchange
    Integrity
      process to detect if a message has been interfered with or faked
  Uses both Symetric and Asymmetric Key Encryption
    a Symmetric Key is sent using Asymmetric Key Incription
    done using the TLS Handshake
  Assumes TCP is being used at the transport layer

Symmetric Key Encryption
  sender and receiver use the same key to decrypt a message
  they key needs to be decided on through other means

Asymmetric Key Encryption
  also known as Public Key Encryption
  Uses a pair of keys
    Public key is used to encrypt a message
    Private Key is used to decrypt it

TLS Handshake
  uses asymmetric key encription to agree on a symetric key to use
  assumes TCP is being used at the transport layer
  takes place after the TCP Handshake
  3 main things
    agrees what version of TLS to use
    Agree on a Cipher Suite
    enable exchange of symmetric keys
  Process
    ClientHello
      sent immediately after the TCP ACK
      has maximim version of the TLS protocol, cipher suites client has
    ServerHello
      after receiving ClientHello
      sets protocol version and Cipher Suite
      sends server certificate which has server's public key
      ServerHelloDone marker - says server's done with its part of handshake
    ClientKeyExchange
      after client receives ServerHelloDone
      Pre-master Secret
        encripted with the server's public key
        used along with other parameters from the cipher suite
          generates the symmetric key
      ChangeCipherSpec
        sent by client
        tells server to start using the symmetric key
      Finished tag
        client telling server it is done with handshake
    Server sends ChangeCipherSpec and Finished flags
  Adds latency
    two rounds of back and forth

DTLS - Datagram Treansport Layer Security
  based on TLS
  used when transport layer uses UDP

Cipher Suites
  a set of ciphers
  Cipher
    a cryptographic algorithm
    a set of steps for perfoming encryption, decription, and related tasks
  TLS uses different ciphers for different aspects
    establishing and maintaining connection
    key exchange
    authentication, key encription, checking message integrity, ...
  decided during TLS Handshake
    client give what algorithms it supports for each task durung ClientHello
    server chooses which to use from what it also supports

TLS Authentication
  Server sends a certificate during the TLS Handshake
    Identifies server and sends its public key
  Server also sends a signature
    data encrypted with the private key
    can be decrypted with the public key
      proves that the sender is legit because it has the private key
  Certificates
    created by Certificate Authorities - CAs
    CAs
      verify the part requesting the certificate is who they say they are
        CA decides how this is done
        can be a file on located on the server
      digitally sign the certificate
        asymmetric key encription like a server's signaure
    Intermediate and Root CAs
      Root CAs authenticate Intermediate CAs
      intermediate CAs authenticate domains
      Client software like browsers store these CAs and their info
        have their public key to verify their signature
      Root CAs are kept very secure
        certificate they issue rely on trust in the CA

TLS Integrity
  TLS PDU
    Header
      content type, TLS Version, Length
    Body
      Data Payload
    Trailer
      MAC
        Message Authentication Code
          No relation to MAC Addresses
        Similar to a checksum from other PDUs
        Checks that the message has not been tampered with in transit
        Done thru a hashing algorithm
          sender creates a digest of the data payload
            small amount of data derived from the actuall data
            created using hashing algorithm and hash value
              deciced with the cipher suite in the TLS Handshake
          sender encrypts the data with the symmetric key
            encapsulates it into a TLS Record
            passes it to the Transpirt layer to be sent
          Receiver decrypts message
