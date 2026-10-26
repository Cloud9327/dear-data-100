Table table;

void setup() {
  size(900, 500);
  background(250, 245, 235);
  noStroke();

  // Try comma-separated first. If the columns didn't split, try tabs.
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
    float y;

    if (sender.equals("human")) {
      fill(230, 120, 90, 200);   // orange = human signal
      y = 170;
    } else {
      fill(80, 150, 200, 200);   // blue = dog signal
      y = 330;
    }

    ellipse(x, y, intensity * 5, intensity * 5);
  }
}
