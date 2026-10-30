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

    float x = gap * (i + 1);
    float y = getY(sender);          // uses the return method
    fill(getColour(sender));         // uses the return method

    ellipse(x, y, intensity * 5, intensity * 5);
  }
}

// Returns the y position for a sender
float getY(String sender) {
  if (sender.equals("human")) {
    return 170;
  } else {
    return 330;
  }
}

// Returns the fill colour for a sender
color getColour(String sender) {
  if (sender.equals("human")) {
    return color(230, 120, 90, 200);   // orange = human
  } else {
    return color(80, 150, 200, 200);   // blue = dog
  }
}
