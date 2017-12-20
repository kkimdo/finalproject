package movie.reserve;

public class ReserveDetailModel {

	String reserve_no;
	int reserve_detailno, seat_no;
	
	public String getReserve_no() {
		return reserve_no;
	}
	public void setReserve_no(String reserve_no) {
		this.reserve_no = reserve_no;
	}
	public int getReserve_detailno() {
		return reserve_detailno;
	}
	public void setReserve_detailno(int reserve_detailno) {
		this.reserve_detailno = reserve_detailno;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
}
