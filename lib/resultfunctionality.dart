import 'dart:math';


class BrainOfCalculator
{
  int weight;
  int height;
  double bmi = 0;

  BrainOfCalculator({this.height,this.weight});

  String getBMI()
  {
    bmi = weight/pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getresult()
  {
    if(bmi >= 25)

      return 'Overweight';

    else if(bmi >= 18.5)

      return 'Normal';

    else
      return 'Underweight';
  }

  String getRecommendation()
  {
    if(bmi >= 25)

      return "You have higher BMI than usual, try to do exercise more!";

    else if(bmi >= 18.5)

      return "You have normal BMI, keep doing whatever you were doing";

    else
      return "You have lower BMI than usual, try to eat more!";
  }
}