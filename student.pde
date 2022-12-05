class Student{
  //fields
  int currentStress;
  int stressManagement;
  int cash;
  String courseA;
  String courseB;
  String courseC;
  String courseD;
  int popularity;
  int xCoordinate;
  int yCoordinate;
  int destinationX;
  int destinationY;
  
  //Constructor
  Student(int s, int m, int h, String a, String b, String c, String d, int p, int x, int y, int X, int Y){
    this.currentStress = s;
    this.stressManagement = m;
    this.cash = h;
    this.courseA = a;
    this.courseB = b;
    this.courseC = c;
    this.courseD = d;    
    this.popularity = p;
    this.xCoordinate = x;
    this.yCoordinate = y;
    this.destinationX = X;
    this.destinationY = Y;
  }
  
  void calculateStress(){
    int stressPercentage = ((this.currentStress*10)-(this.stressManagement*10)+(this.popularity*10))/2;
    println(stressPercentage);
  }
  void startposition(){
    
  }
}
