import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank {

  //  the stable keyword is used to declare a variable that can persist across upgrades of the canister that contains the variable.
  stable var currentValue = 0;

  // Get the value of the currentValue.
  public query func get() : async Nat {
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
  public func deposit(amount : Nat) : async () {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // withdraw from the value of the currentValue.
  public func withdraw(amount : Nat) : async () {
    let currentBalance : Int = currentValue - amount;
    if (currentBalance >= 0) {
      var currentBalance : Int = currentValue - amount;
      Debug.print(debug_show (currentBalance));
    } else {
      Debug.print(debug_show ("Insufficient Balance!"));
    };
  };

  // Set the value of the currentValue.
  public func set(amount : Nat) : async () {
    currentValue := amount;
    Debug.print(debug_show (currentValue));
  };
};
