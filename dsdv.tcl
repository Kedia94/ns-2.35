# wrls1.tcl
# A 3-node example for ad-hoc simulation with DSDV

# Define options
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             100                        ;# number of mobilenodes
set val(rp)             DSDV                       ;# routing protocol
set val(x)              1000  			   ;# X dimension of topography
set val(y)              1000   			   ;# Y dimension of topography  
set val(stop)		160			   ;# time of simulation end

set ns		  [new Simulator]
set tracefd       [open simple.tr w]
set windowVsTime2 [open win.tr w] 
set namtrace      [open simwrls.nam w]    

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)
$val(mac) set basicRate_ 200Mb
#
#  Create nn mobilenodes [$val(nn)] and attach them to the channel. 
#

# configure the nodes
        $ns node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON \
			 -macTrace OFF \
			 -movementTrace ON
			 
	for {set i 0} {$i < $val(nn) } { incr i } {
		set node_($i) [$ns node]	
	}

# Provide initial location of mobilenodes
$node_(0) set X_ 0.0
$node_(0) set Y_ 0.0

$node_(1) set X_ 200.0
$node_(1) set Y_ 0.0

$node_(2) set X_ 400.0
$node_(2) set Y_ 0.0

$node_(3) set X_ 600.0
$node_(3) set Y_ 0.0

$node_(4) set X_ 800.0
$node_(4) set Y_ 0.0

$node_(5) set X_ 1000.0
$node_(5) set Y_ 0.0

$node_(6) set X_ 500.0
$node_(6) set Y_ 1000.0
$node_(7) set X_ 131.5
$node_(7) set Y_ 458.7
$node_(8) set X_ 219.0
$node_(8) set Y_ 678.9
$node_(9) set X_ 934.7
$node_(9) set Y_ 519.4
$node_(10) set X_ 34.6
$node_(10) set Y_ 529.7
$node_(11) set X_ 7.7
$node_(11) set Y_ 66.8
$node_(12) set X_ 686.8
$node_(12) set Y_ 930.4
$node_(13) set X_ 526.9
$node_(13) set Y_ 653.9
$node_(14) set X_ 701.2
$node_(14) set Y_ 762.2
$node_(15) set X_ 47.5
$node_(15) set Y_ 328.2
$node_(16) set X_ 756.4
$node_(16) set Y_ 365.3
$node_(17) set X_ 982.6
$node_(17) set Y_ 753.4
$node_(18) set X_ 72.7
$node_(18) set Y_ 884.7
$node_(19) set X_ 436.4
$node_(19) set Y_ 477.7
$node_(20) set X_ 274.9
$node_(20) set Y_ 166.5
$node_(21) set X_ 897.7
$node_(21) set Y_ 60.6
$node_(22) set X_ 504.5
$node_(22) set Y_ 319.0
$node_(23) set X_ 494.0
$node_(23) set Y_ 90.7
$node_(24) set X_ 73.7
$node_(24) set Y_ 384.1
$node_(25) set X_ 913.8
$node_(25) set Y_ 464.4
$node_(26) set X_ 50.1
$node_(26) set Y_ 770.2
$node_(27) set X_ 125.4
$node_(27) set Y_ 688.5
$node_(28) set X_ 629.5
$node_(28) set Y_ 725.4
$node_(29) set X_ 888.6
$node_(29) set Y_ 306.3
$node_(30) set X_ 513.3
$node_(30) set Y_ 846.0
$node_(31) set X_ 841.5
$node_(31) set Y_ 415.4
$node_(32) set X_ 467.9
$node_(32) set Y_ 178.3
$node_(33) set X_ 571.7
$node_(33) set Y_ 33.1
$node_(34) set X_ 498.5
$node_(34) set Y_ 748.3
$node_(35) set X_ 890.7
$node_(35) set Y_ 842.0
$node_(36) set X_ 212.8
$node_(36) set Y_ 130.4
$node_(37) set X_ 274.6
$node_(37) set Y_ 414.3
$node_(38) set X_ 709.8
$node_(38) set Y_ 239.9
$node_(39) set X_ 317.5
$node_(39) set Y_ 652.1
$node_(40) set X_ 681.3
$node_(40) set Y_ 387.7
$node_(41) set X_ 147.5
$node_(41) set Y_ 845.6
$node_(42) set X_ 955.4
$node_(42) set Y_ 148.2
$node_(43) set X_ 408.8
$node_(43) set Y_ 564.9
$node_(44) set X_ 488.5
$node_(44) set Y_ 961.1
$node_(45) set X_ 199.8
$node_(45) set Y_ 629.3
$node_(46) set X_ 651.3
$node_(46) set Y_ 803.1
$node_(47) set X_ 476.4
$node_(47) set Y_ 203.3
$node_(48) set X_ 901.7
$node_(48) set Y_ 142.0
$node_(49) set X_ 410.3
$node_(49) set Y_ 885.6
$node_(50) set X_ 162.2
$node_(50) set Y_ 365.3
$node_(51) set X_ 135.1
$node_(51) set Y_ 455.3
$node_(52) set X_ 452.3
$node_(52) set Y_ 931.7
$node_(53) set X_ 215.2
$node_(53) set Y_ 908.9
$node_(54) set X_ 860.9
$node_(54) set Y_ 506.0
$node_(55) set X_ 817.6
$node_(55) set Y_ 462.2
$node_(56) set X_ 632.7
$node_(56) set Y_ 824.7
$node_(57) set X_ 702.2
$node_(57) set Y_ 954.4
$node_(58) set X_ 289.3
$node_(58) set Y_ 514.4
$node_(59) set X_ 414.0
$node_(59) set Y_ 876.6
$node_(60) set X_ 729.7
$node_(60) set Y_ 715.6
$node_(61) set X_ 706.5
$node_(61) set Y_ 19.1
$node_(62) set X_ 525.0
$node_(62) set Y_ 65.2
$node_(63) set X_ 488.9
$node_(63) set Y_ 682.0
$node_(64) set X_ 916.6
$node_(64) set Y_ 890.0
$node_(65) set X_ 139.2
$node_(65) set Y_ 989.4
$node_(66) set X_ 446.0
$node_(66) set Y_ 514.7
$node_(67) set X_ 439.7
$node_(67) set Y_ 806.6
$node_(68) set X_ 211.5
$node_(68) set Y_ 153.6
$node_(69) set X_ 616.4
$node_(69) set Y_ 0.9
$node_(70) set X_ 727.3
$node_(70) set Y_ 417.7
$node_(71) set X_ 680.6
$node_(71) set Y_ 836.4
$node_(72) set X_ 828.7
$node_(72) set Y_ 81.7
$node_(73) set X_ 629.6
$node_(73) set Y_ 213.5
$node_(74) set X_ 388.8
$node_(74) set Y_ 947.5
$node_(75) set X_ 269.2
$node_(75) set Y_ 284.0
$node_(76) set X_ 783.9
$node_(76) set Y_ 282.2
$node_(77) set X_ 11.3
$node_(77) set Y_ 983.2
$node_(78) set X_ 819.7
$node_(78) set Y_ 398.1
$node_(79) set X_ 176.9
$node_(79) set Y_ 157.7
$node_(80) set X_ 257.2
$node_(80) set Y_ 101.6
$node_(81) set X_ 634.7
$node_(81) set Y_ 794.8
$node_(82) set X_ 752.9
$node_(82) set Y_ 633.4
$node_(83) set X_ 598.2
$node_(83) set Y_ 318.8
$node_(84) set X_ 117.4
$node_(84) set Y_ 526.1
$node_(85) set X_ 588.0
$node_(85) set Y_ 703.0
$node_(86) set X_ 161.7
$node_(86) set Y_ 860.2
$node_(87) set X_ 556.8
$node_(87) set Y_ 316.0
$node_(88) set X_ 528.5
$node_(88) set Y_ 588.1
$node_(89) set X_ 430.8
$node_(89) set Y_ 370.2
$node_(90) set X_ 446.9
$node_(90) set Y_ 387.8
$node_(91) set X_ 78.3
$node_(91) set Y_ 253.9
$node_(92) set X_ 676.2
$node_(92) set Y_ 728.6
$node_(93) set X_ 944.8
$node_(93) set Y_ 940.2
$node_(94) set X_ 460.4
$node_(94) set Y_ 661.4
$node_(95) set X_ 605.6
$node_(95) set Y_ 150.4
$node_(96) set X_ 343.8
$node_(96) set Y_ 522.8
$node_(97) set X_ 15.0
$node_(97) set Y_ 643.0
$node_(98) set X_ 917.8
$node_(98) set Y_ 970.1
$node_(99) set X_ 844.0
$node_(99) set Y_ 455.8


# Generation of movements
$ns at 10.0 "$node_(0) setdest 15.0 150.0 0.0"
$ns at 15.0 "$node_(1) setdest 45.0 85.0 0.0"
$ns at 110.0 "$node_(0) setdest 80.0 30.0 0.0" 
set udp [new Agent/UDP]
set null [new Agent/LossMonitor]
$ns attach-agent $node_(0) $udp
$ns attach-agent $node_(6) $null
$ns connect $udp $null
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$ns at 0.0 "$cbr start"
set udp1 [new Agent/UDP]
set null1 [new Agent/LossMonitor]
$ns attach-agent $node_(1) $udp1
$ns attach-agent $node_(6) $null1
$ns connect $udp1 $null1
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$ns at 0.0 "$cbr1 start"
set udp2 [new Agent/UDP]
set null2 [new Agent/LossMonitor]
$ns attach-agent $node_(2) $udp2
$ns attach-agent $node_(6) $null2
$ns connect $udp2 $null2
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$ns at 0.0 "$cbr2 start"
set udp3 [new Agent/UDP]
set null3 [new Agent/LossMonitor]
$ns attach-agent $node_(3) $udp3
$ns attach-agent $node_(6) $null3
$ns connect $udp3 $null3
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$ns at 0.0 "$cbr3 start"
set udp4 [new Agent/UDP]
set null4 [new Agent/LossMonitor]
$ns attach-agent $node_(4) $udp4
$ns attach-agent $node_(6) $null4
$ns connect $udp4 $null4
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$ns at 0.0 "$cbr4 start"
set udp5 [new Agent/UDP]
set null5 [new Agent/LossMonitor]
$ns attach-agent $node_(5) $udp5
$ns attach-agent $node_(6) $null5
$ns connect $udp5 $null5
set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp5
$ns at 0.0 "$cbr5 start"
$cbr set packetSize_ 32kb
$cbr set rate_ 32kb
$cbr set random_ false
$cbr1 set packetSize_ 32kb
$cbr1 set rate_ 32kb
$cbr1 set random_ false
$cbr2 set packetSize_ 32kb
$cbr2 set rate_ 32kb
$cbr2 set random_ false
$cbr3 set packetSize_ 32kb
$cbr3 set rate_ 32kb
$cbr3 set random_ false
$cbr4 set packetSize_ 32kb
$cbr4 set rate_ 32kb
$cbr4 set random_ false
$cbr5 set packetSize_ 32kb
$cbr5 set rate_ 32kb
$cbr5 set random_ false


set udp6 [new Agent/UDP]
set null6 [new Agent/LossMonitor]
$ns attach-agent $node_(24) $udp6
$ns attach-agent $node_(25) $null6
$ns connect $udp6 $null6
set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$ns at 80.0 "$cbr6 start"
$ns at 150.0 "$cbr6 end"
$cbr6 set packetSize_ 32kb
$cbr6 set rate_ 32kb
$cbr6 set random_ false

# Set a TCP connection between node_(0) and node_(1)
set p0 [new Agent/Ping]
set p1 [new Agent/Ping]
$ns attach-agent $node_(23) $p0
$ns attach-agent $node_(18) $p1
$ns connect $p0 $p1
$ns at 0.0 "$p1 send"
$ns at 10.0 "$p1 send"
$ns at 20.0 "$p1 send"
$ns at 30.0 "$p1 send"
$ns at 40.0 "$p1 send"
$ns at 50.0 "$p1 send"
$ns at 60.0 "$p1 send"
$ns at 70.0 "$p1 send"
$ns at 80.0 "$p1 send"
$ns at 90.0 "$p1 send"
$ns at 100.0 "$p1 send"
$ns at 110.0 "$p1 send"
$ns at 120.0 "$p1 send"
$ns at 130.0 "$p1 send"
$ns at 140.0 "$p1 send"

# Printing the window size
proc plotWindow {tcpSource file} {
global ns
set time 0.01
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file" }
#$ns at 10.1 "plotWindow $tcp $windowVsTime2"  

Agent/Ping instproc recv {from rtt} {
	$self instvar node_
	puts "node [$node_ id] received ping answer from $from with round-trip-time $rtt ms."
}
	for {set i 0} {$i < $val(nn) } { incr i } {
		$node_($i) random-motion 1
	}
# Define node initial position in nam
for {set i 0} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns initial_node_pos $node_($i) 30
}

# Telling nodes when the simulation ends
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation 
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 100.0 "finish"


proc finish {} {
	global null null1 null2 null3 null4 null5
	set r [$null set nlost_]
	set t [$null set npkts_]
	puts "0: $r $t"
	set r [$null1 set nlost_]
	set t [$null1 set npkts_]
	puts "1: $r $t"
	set r [$null2 set nlost_]
	set t [$null2 set npkts_]
	puts "3: $r $t"
	set r [$null3 set nlost_]
	set t [$null3 set npkts_]
	puts "4: $r $t"
	set r [$null4 set nlost_]
	set t [$null4 set npkts_]
	puts "5: $r $t"
	set r [$null5 set nlost_]
	set t [$null5 set npkts_]
	puts "6: $r $t"
}
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run

