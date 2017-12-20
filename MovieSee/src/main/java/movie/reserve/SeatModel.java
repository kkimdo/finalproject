package movie.reserve;

public class SeatModel {

	int seat_no;
	String seat_name;
	int seat_position;
	int seat_room_no;
	int seat_reserved;
	
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public int getSeat_position() {
		return seat_position;
	}
	public void setSeat_position(int seat_position) {
		this.seat_position = seat_position;
	}
	public int getSeat_room_no() {
		return seat_room_no;
	}
	public void setSeat_room_no(int seat_room_no) {
		this.seat_room_no = seat_room_no;
	}
	public int getSeat_reserved() {
		return seat_reserved;
	}
	public void setSeat_reserved(int seat_reserved) {
		this.seat_reserved = seat_reserved;
	}
}
