 class Variable{
 int x1 = 5;
 int x2 = 15;
 int x3 = 532;
 String ishan="ishan";
 Object object= new Object();

 Object m(int x){

 }
 Object m(String x){

 }
 
 int m(String x){

 }

 public static void main(String[] args) {
 //primitive variable
 int rows = 5; 
 //Object variable
 Object object1= new Object();

 String ishanLocal="ishan";

//controle structure
 for(int i = 1; i <= rows; ++i) { 
 for(int j = 1; j <= i; ++j) { 
  System.out.print(j + " ");  
  }     
  System.out.println(""); 
  }

//case controle structure

int day = 4;
switch (day) {
  case 1:
    System.out.println("Monday");
    break;
  case 2:
    System.out.println("Tuesday");
    break;
  case 3:
    System.out.println("Wednesday");
    break;
  case 4:
    System.out.println("Thursday");
    break;
  case 5:
    System.out.println("Friday");
    break;
  case 6:
    System.out.println("Saturday");
    break;
  case 7:
    System.out.println("Sunday");
    break;
}
// Outputs "Thursday" (day 4)


//if controle structure

if (20 > 18 && 12==12 | 11<=11) {
  System.out.println("20 is greater than 18");
}
        
  }        
  }