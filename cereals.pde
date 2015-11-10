class Cereals
{
  String name;
  float calories;
  float protein;
  float fat;
  float sodium;
  float fiber;
  float carbs;
  float sugar;
  float potassium;
  float vitamins;
  
  Cereals( String line)
  {
    String[] parts = line.split(";");
     
    this.name = parts[0];
    calories = Float.parseFloat(parts[3]);
    protein = Float.parseFloat(parts[4]);
    fat = Float.parseFloat(parts[5]);
    sodium = Float.parseFloat(parts[6]);
    fiber = Float.parseFloat(parts[7]);
    carbs = Float.parseFloat(parts[8]);
    sugar = Float.parseFloat(parts[9]);
    potassium = Float.parseFloat(parts[10]);
    vitamins = Float.parseFloat(parts[11]);
  }
}
