class Cereals
{
  String name;
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
    protein = Float.parseFloat(parts[3]);
    fat = Float.parseFloat(parts[4]);
    sodium = Float.parseFloat(parts[5]);
    fiber = Float.parseFloat(parts[6]);
    carbs = Float.parseFloat(parts[7]);
    sugar = Float.parseFloat(parts[8]);
    potassium = Float.parseFloat(parts[9]);
    vitamins = Float.parseFloat(parts[10]);
  }
}
