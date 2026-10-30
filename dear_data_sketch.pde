//A method is a named block of code that does one specific job. It can take parameters (inputs), and it can either 
//do something (a void method) or give a value back (a return method). Using methods stops me repeating code and makes the 
//program easier to read and change.

Table table;

void setup() {
  size(900, 500);
  background(250, 245, 235);
  noStroke();

  table = loadTable("Data.csv", "header, csv");
  if (table.getColumnCount() < 8) {
    table = loadTable("Data.csv", "header, tsv");
  }

  int n = table.getRowCount();
  float gap = width / (float)(n + 1);

  for (int i = 0; i < n; i++) {
    TableRow row = table.getRow(i);
    String sender = row.getString("Sender");
    int intensity = row.getInt("Intensity");

//In my sketch I wrote getY(String sender). It takes the sender as a parameter and returns a float: 170 if
//the sender is ‘human’, otherwise 330. The return type float has to match the value I return.
//I call it in setup() with float y = getY(sender);, and the returned value is stored in y and used to position each circle.

    float x = gap * (i + 1);
                                    // uses the return method ,You can tell they’re return methods because they have a return type (float, color) instead of void, 
     float y = getY(sender);         //  and they use return to hand a value back. They’re called in setup() here :                                
    fill(getColour(sender));         // uses the return method

    ellipse(x, y, intensity * 5, intensity * 5);
  }
}

// Returns the y position for a sender
float getY(String sender) { //returns a float, the y position (170 for human, 330 for dog).
  if (sender.equals("human")) {
    return 170;
  } else {
    return 330;
  }
}

// Returns the fill colour for a sender
color getColour(String sender) { //returns a color, the fill colour for that sender.
  if (sender.equals("human")) {
    return color(230, 120, 90, 200);   // orange = human
  } else {
    return color(80, 150, 200, 200);   // blue = dog
  }
}
