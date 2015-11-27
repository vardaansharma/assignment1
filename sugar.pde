class Sugar 
{
  float year;
  float us;
  float canada;
  float germany;
  float france;
  float uk;

  
  Sugar(String line)
  {
     String[] parts = line.split(";");
    us = Float.parseFloat(parts[0]);
    year = Float.parseFloat(parts[1]);
    germany = Float.parseFloat(parts[2]);
    france = Float.parseFloat(parts[3]);
    uk = Float.parseFloat(parts[4]);
    canada = Float.parseFloat(parts[6]);
  }
}