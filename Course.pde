class Course {
  
  String name;
  int homework, tests, workload, difficulty, stressfulness;
  
  Course(String n, int h, int t, int d) {
    this.name = n;
    this.homework = h;
    this.tests = t;
    this.workload = h + t;
    this.difficulty = d;
    this.stressfulness = h + t + d;
  }
  
}
