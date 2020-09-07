=========================================================================

170 notes

=========================================================================


Protocols
  system of rules
  define how messages are passed over a network
  address different aspects of communication
    transer of messages between applications - TCP & UDP
    structure of messages - HTTP

Layered System
  two models
    OSI    - devides layers in terms of the functions they provide
    TCP/IP - devides layers by the scope of communication

        OSI             TCP/IP
                  ___
      Application
      Presentation    Application
      Session     ___
      Transport   ___ Transport
      Network     ___ Internet
      Data Link       Link
      Physical    ___

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
  Switch
    Keeps record of MAC addresses on the network
    sends frames only to desination

Internet/Network Layer
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
