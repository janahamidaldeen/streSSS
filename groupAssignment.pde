import g4p_controls.*;

ArrayList<Student> students = new ArrayList<Student>();
int ySpeed = 5;
int xSpeed = 5;
void setup() {
  size(1000, 500);
  Student x = new Student(3, 6, 15, "Math", "Gym", "Tech", "Languages", 3, 130, 500, 300, 120);
  Student y = new Student(4, 2, 14, "Math", "Gym", "Tech", "Languages", 4, 50, 500, 800, 120);

  x.calculateStress();
  students.add(x);
  students.add(y);
}

void draw() {
  background(84, 166, 40);
  fill(255);
  rect(0, 0, 200, 200);
  rect(200, 0, 200, 200);
  rect(400, 0, 200, 200);
  rect(600, 0, 200, 200);
  rect(800, 0, 200, 200);
  fill(252, 186, 3);
  for (int s=0; s<students.size(); s++){
    students.get(s).yCoordinate -= ySpeed;
    circle(students.get(s).xCoordinate, students.get(s).yCoordinate, 30);
    if (students.get(s).xCoordinate == students.get(s).destinationX && students.get(s).yCoordinate == students.get(s).destinationY){
      ySpeed = 0;
      xSpeed = 0;    
    }
    else if (students.get(s).xCoordinate == students.get(s).destinationX){
      xSpeed = 0;    
    }
    else if (students.get(s).yCoordinate == students.get(s).destinationY){
      ySpeed = 0;    
    }
    if (students.get(s).xCoordinate > students.get(s).destinationX - 1 ) {
      students.get(s).xCoordinate -= xSpeed;
    }
    else if (students.get(s).xCoordinate < students.get(s).destinationX - 1 ) {
      students.get(s).xCoordinate += xSpeed;
    }
  }
}
