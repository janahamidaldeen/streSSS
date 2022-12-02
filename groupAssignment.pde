ArrayList<Student> students = new ArrayList<Student>();

void setup() {
  size(1000, 500);
  Student x = new Student(3, 6, 15, "Math", "Gym", "Tech", "Languages", 3, 123, 500, 300, 120);
  
  x.calculateStress();
  students.add(x);
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
    int yStudent = students.get(s).yCoordinate;
    circle(students.get(s).xCoordinate, yStudent, 30);
    if (yStudent>students.get(s).destinationY){
      while (yStudent != students.get(s).destinationY)
        yStudent = yStudent - 1;
    }
  }
}
