set ns [new Simulator]
#Routing Protocol - Distance Vector
#bs rtproto DV
set nf [open lab.nam w]
$ns namtrace-all $nf
set tf [open lab.tr w]
$ns trace-all $tf

proc finish {} {
    global ns nf tf
    $ns flush-trace
    close $nf
    close $tf
    exec nam a lab.nam &
    exec awk -f lab.awk lab.tr &amp;
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$ns duplex-link $n0 $n1 1Mb 100ms DropTail
$ns duplex-link $n2 $n1 1Mb 100ms DropTail
$ns duplex-link $n1 $n3 2.5Mb 40ms DropTail
$ns duplex-link $n1 $n4 0.5Mb 100ms DropTail
$ns duplex-link $n3 $n5 2.5Mb 40ms DropTail
$ns duplex-link $n4 $n5 0.5Mb 100ms DropTail

#Give node position (for NAM)
$ns duplex-link-op $n0 $n1 orient right-down
$ns duplex-link-op $n2 $n1 orient right-up
$ns duplex-link-op $n1 $n3 orient right-up
$ns duplex-link-op $n1 $n4 orient right-down
$ns duplex-link-op $n3 $n5 orient right-down
$ns duplex-link-op $n4 $n5 orient right-up

#Setup a UDP connection
set udp [new Agent/UDP]
$ns attach-agent $n0 $udp
set null [new Agent/Null]
$ns attach-agent $n5 $null
$ns connect $udp $null
$udp set fid_ 1
$ns color 1 blue

#Setup a CBR over UDP connection
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR
$cbr set window_ 5
$cbr set packetSize_ 1000000

#Setup a UDP connection
set udp2 [new Agent/UDP]
$ns attach-agent $n2 $udp2
set null [new Agent/Null]
$ns attach-agent $n5 $null
$ns connect $udp2 $null
$udp2 set fid_ 2
$ns color 2 red

#Setup a CBR over UDP connection
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set type_ CBR
$cbr2 set window_ 5
$cbr2 set packetSize_ 1000000

$ns at 1.0 "$cbr start"
$ns at 1.1 "$cbr2 start"
$ns rtmodel-at 5.0 down $n1 $n3
$ns at 19.1 "$cbr2 stop"
$ns at 19.0 "$cbr stop"
$ns at 20.0 "finish"

$ns run
