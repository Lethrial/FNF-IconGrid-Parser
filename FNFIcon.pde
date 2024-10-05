class FNFIcon {
  String name;    // Display name of the character
  String id;      // Name used in the exported image
  float x;        // x value of the icon on the grid
  float y;        // y value of the icon on the grid
  float losingX;  // x value of the losing icon on the grid
  float losingY;  // y value of the losing icon on the grid
  
  FNFIcon(String daName, String daID, float daX, float daY, float lX, float lY) {
    name = daName;
    id = daID;
    x = -daX;
    y = -daY;
    losingX = -lX;
    losingY = -lY;
  }
}
