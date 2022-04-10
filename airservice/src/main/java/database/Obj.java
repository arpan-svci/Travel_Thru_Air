package database;

public class Obj {
	private String id;
	private String source;
	private String destination;
	private String stops;
	private String time_deperature;
	private String time_arrival;
	private String fare;
	public Obj() {}
	public Obj(String id,String source,String destination,String stops,String time_deperature,String time_arrival) {
		super();
		this.id=id;
		this.source=source;
		this.destination=destination;
		this.stops=stops;
		this.time_deperature=time_deperature;
		this.time_arrival=time_arrival;
	}
	public String getTime_deperature() {
		return time_deperature;
	}
	public void setTime_deperature(String time_deperature) {
		this.time_deperature = time_deperature;
	}
	public String getTime_arrival() {
		return time_arrival;
	}
	public void setTime_arrival(String time_arrival) {
		this.time_arrival = time_arrival;
	}
	public String getStops() {
		return stops;
	}
	public void setStops(String stops) {
		this.stops = stops;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFare() {
		return fare;
	}
	public void setFare(String fare) {
		this.fare = fare;
	}
}
