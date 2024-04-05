// Imports
import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Text "mo:base/Text";

actor exercise_tracker {

  type Exercise = {
    name: Text;
    sets: Nat;
    reps: Nat;
    completed: Bool;
    weight: ?Nat;  // Optional weight (can be bodyweight)
    target: Text;  // Target muscle group or aim of the exercise
    category: Text; // Cardio, weightlifting, etc.
  };

  func natHash(n: Nat) : Hash.Hash {
    Text.hash(Nat.toText(n))
  };

  var exercises = Map.HashMap<Nat, Exercise>(0, Nat.equal, natHash);
  var nextId: Nat = 0;

  // Get all exercises
  public query func getExercises() : async [Exercise] {
    Iter.toArray(exercises.vals());
  };

  // Add a new exercise
  public func addExercise(name: Text, sets: Nat, reps: Nat, weight: ?Nat, target: Text, category: Text) : async Nat {
    let id = nextId;
    exercises.put(id, {
      name = name;
      sets = sets;
      reps = reps;
      completed = false;
      weight = weight;
      target = target;
      category = category;
    });
    nextId += 1;
    id // Return the ID of the added exercise
  };

  // Mark an exercise as completed
  public func completeExercise(id: Nat) : async () {
    ignore do ? {
    let exercise = exercises.get(id)!;
    exercises.put(id, {
      name = exercise.name;
      sets = exercise.sets;
      reps = exercise.reps;
      completed = true;
      weight = exercise.weight;
      target = exercise.target;
      category = exercise.category;
      });
    }
  };

  // Show all exercises
  public query func showExercises() : async Text {
    var output: Text = "\n_____WORKOUT_____";
    for (exercise: Exercise in exercises.vals()) {
      output #= "\n" # formatExercise(exercise);
    };
    output # "\n"
  };

  // Clear completed exercises
  public func clearCompleted() : async() {
    exercises := Map.mapFilter<Nat, Exercise, Exercise>(exercises, Nat.equal, natHash,
      func(_, exercise) {if (exercise.completed) null else ?exercise});
  };

  // Helper function for formatting exercises
  private func formatExercise(exercise: Exercise): Text {
    let completedText: Text = "";
    if (exercise.completed) {
    let completedText = "+";
    };
    return (
    "(" # Nat.toText(exercise.sets) # " sets, " # Nat.toText(exercise.reps) # " reps)" #
    completedText #
    ", Target: " # exercise.target # ", Category: " # exercise.category # completedText
    );
  }
};
