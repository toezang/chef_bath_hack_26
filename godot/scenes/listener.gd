extends Node

signal message_received(msg: String)

var udp = PacketPeerUDP.new()

func _ready():
	udp.bind(9999)
	print("Listening")

func _process(_delta):
	while udp.get_available_packet_count() > 0:
		var packet = udp.get_packet()
		var msg = packet.get_string_from_ascii()
		var clean = msg.replace(char(0), "").strip_edges()
		print("CLEAN: [", clean, "]")
		message_received.emit(clean)
