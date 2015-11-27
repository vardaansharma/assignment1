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
  
  Cereals( Cereals cereal)
  {
  
  fill(255);
  stroke(0);
  float move= 0.0f; 
  move = mouseX * 0.01;
  
  float total = cereal.sugar + cereal.protein + cereal.fat + cereal.fiber + cereal.carbs;
  float boxscale = map(1,0,total,0,150);
  
  float location = height/2 + map((total/2), 0,total , 0, 150) - (map(cereal.sugar,0,total,0,150))/2;
  pushMatrix();
  translate(width/2, location, 120);
  rotateY(move);
  fill(0,0,255);
  box(100, map(cereal.sugar,0,total,0,150), 70);
  fill(0,0,255);
  popMatrix();
  
   location -= ( ((boxscale*(cereal.protein))/2) + ((boxscale*(cereal.sugar))/2) );
  pushMatrix();
  translate(width/2, location, 120);
  rotateY(move);
  fill(255,0,0);
  box(100, map(cereal.protein,0,total,0,150), 70);
  popMatrix();
  
  location -=( ((boxscale*(cereal.fiber))/2) + ((boxscale*(cereal.protein))/2) );
  pushMatrix();
  translate(width/2, location, 120);
  rotateY(move);
  fill(0,255,0);
  box(100, map(cereal.fiber,0,total,0,150), 70);
  popMatrix();
  
  location -=( ((boxscale*(cereal.fat))/2) + ((boxscale*(cereal.fiber))/2) );
  pushMatrix();
  translate(width/2, location, 120);
  rotateY(move);
  fill(89,56,78);
  box(100, map(cereal.fat,0,total,0,150), 70);
  popMatrix();
  
  location -= ( ((boxscale*(cereal.carbs))/2) + ((boxscale*(cereal.fat))/2) );
  pushMatrix();
  translate(width/2, location, 120);
  rotateY(move);
  fill(255);
  box(100, map(cereal.carbs,0,total,0,150), 70);
  popMatrix();
    
  fill(0,0,255);
  textAlign(LEFT);
  text("sugar",45,height-35);
  
  fill(255,0,0);
  text("protein",45,height-55);
  
  fill(0,255,0);
  text("fiber",45,height-75);
  
  fill(89,56,78);
  text("fat",45,height-95);
  
  fill(255);
  text("carbohydrates",45,height-115);
  }
}