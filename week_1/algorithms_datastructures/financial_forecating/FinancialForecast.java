public class FinancialForecast {

    // Recursive method to calculate future value
    public static double predictFutureValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        return predictFutureValue(currentValue * (1 + growthRate), growthRate, years - 1);
    }

    public static void main(String[] args) {
        double presentValue = 10000;   
        double annualGrowthRate = 0.08; 
        int numberOfYears = 5;

        double futureValue = predictFutureValue(presentValue, annualGrowthRate, numberOfYears);

        System.out.println("Predicted future value after "+numberOfYears+" years: "+futureValue);
    }
}
