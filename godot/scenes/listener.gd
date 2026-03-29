extends Node

var udp = PacketPeerUDP.new()

func _ready():
	udp.bind(9999)
	print("Listening")

func _process(_delta):
	while udp.get_available_packet_count() > 0:
		var msg = udp.get_packet().get_string_from_utf8()
		print(msg)
