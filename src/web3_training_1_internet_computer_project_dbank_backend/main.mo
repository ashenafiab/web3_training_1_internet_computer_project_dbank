import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  Debug.print("Hello");
  Debug.print(debug_show(currentValue));
}