
public class FlightTicket {
	public  FlightTicket() {
		// TODO Auto-generated constructor stub\
		departureDate = new Date();
		departureTime = new Time();
	}
	Date departureDate;
	Time departureTime;
	byte noOfTicket;
	double price = 1000;
	double totalPrice;
	byte typeOfCabin;
	
	void getDepartureTime()
	{
		System.out.println("Departure Time: " + departureTime.hours + ":" + departureTime.minutes);
	}
	void getDepartureDate()
	{
		System.out.println("Departure Date: " + departureDate.day + "/" + departureDate.month + "/" + departureDate.year);
	}
	void setDepartureDate(byte d, byte m, byte y)
	{
		departureDate.day = d;
		departureDate.month= m;
		departureDate.year = y;
	}
	void setDepartureTime(byte h, byte m)
	{
		departureTime.hours = h;
		departureTime.minutes = m;
	}
	
}
