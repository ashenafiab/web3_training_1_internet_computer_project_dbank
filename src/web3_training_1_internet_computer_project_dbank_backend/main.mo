import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {

  //  the stable keyword is used to declare a variable that can persist across upgrades of the canister that contains the variable.
  stable var currentValue:Float = 0;

  stable var startTime = Time.now();
  Debug.print(debug_show (startTime));

  // Get the value of the currentValue.
  public query func get() : async Float {
    return currentValue;
  };

  // Increment the value of the currentValue.
  public func inc() : async () {
    currentValue += 1;
    Debug.print(debug_show (currentValue));
  };

  // Decrement the value of the currentValue.
  public func dec() : async () {
    if (currentValue > 0) {
      currentValue -= 1;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print(debug_show ("Insufficient Balance!"));
    };
  };

  // deposit to the value of the currentValue.
  public func deposit(amount : Float) : async () {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // withdraw from the value of the currentValue.
  public func withdraw(amount : Float) : async () {
    let currentBalance : Float = currentValue - amount;
    if (currentBalance >= 0) {
      var currentBalance : Float = currentValue - amount;
      Debug.print(debug_show (currentBalance));
    } else {
      Debug.print(debug_show ("Insufficient Balance!"));
    };
  };

  // Set the value of the currentValue.
  public func set(amount : Float) : async () {
    currentValue := amount;
    Debug.print(debug_show (currentValue));
  };

  //
  public func compoundInterest() : async () {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    let rate: Float = 0.01;
    let m: Nat = 1;

    currentValue := (currentValue) * (Float.pow(1.0 + (Float.div(rate, 100.0)), Float.fromInt(timeElapsedS)));
    let compoundInterest = currentValue;
    Debug.print(debug_show (compoundInterest));
  };

};
