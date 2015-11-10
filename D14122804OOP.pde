ArrayList<Cereals> clist = new ArrayList<Cereals>();

void setup()
{
  size(600,600);
  background(0);
  loaddata();
  
}

void loaddata()
{
  String[] data = loadStrings("cereal.csv");
  
  for ( int i =2 ; i <data.length ; ++i)
  {
    Cereals temp = new Cereals(data[i]);
    clist.add(temp);
  }
}
    
  
 
