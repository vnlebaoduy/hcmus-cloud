
public class DateTests 
{	
		public DateTests() {
			
		}
		public static void main(String[] agr)
		{
			Date dateOfFlight = new Date();
			System.out.println("\nDefault values of intance variable of date intance:");
			System.out.printf("day = %02d\t\t" ,dateOfFlight.day);
			System.out.printf("day = %02d\t\t" ,dateOfFlight.month);
			System.out.println("year: " + dateOfFlight.year);
			
			dateOfFlight.day = 02;
			dateOfFlight.month= 06;
			dateOfFlight.year = 2010;
			System.out.println("\nNew values of intance variable of date intance:");
			System.out.printf("day = %02d\t\t" ,dateOfFlight.day);
			System.out.printf("day = %02d\t\t" ,dateOfFlight.month);
			System.out.println("year: " + dateOfFlight.year);
			/**
			 * this is my comment
			 */
		}	
}
