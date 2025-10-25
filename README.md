# Fitness Tracker - Internet Computer Application

[![Internet Computer](https://img.shields.io/badge/Internet%20Computer-000000?style=for-the-badge&logo=internetcomputer&logoColor=white)](https://internetcomputer.org/)
[![Motoko](https://img.shields.io/badge/Motoko-000000?style=for-the-badge&logo=motoko&logoColor=white)](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/motoko/)
[![DFX](https://img.shields.io/badge/DFX-000000?style=for-the-badge&logo=dfinity&logoColor=white)](https://internetcomputer.org/docs/current/developer-docs/setup/install/)

A decentralized fitness tracking application built on the Internet Computer using Motoko. This application allows users to create, manage, and track their workout routines in a secure, decentralized environment.

## Features

### Core Functionality
- **Exercise Logging**: Create detailed exercise entries with customizable parameters
- **Workout Management**: Add, track, and organize your fitness routines
- **Progress Tracking**: Mark exercises as completed and monitor your consistency
- **Data Management**: Clean up completed exercises to maintain an organized workout plan

### Exercise Data Model
Each exercise includes:
- **Name**: Exercise identifier
- **Sets & Reps**: Workout volume tracking
- **Weight**: Optional weight parameter (supports bodyweight exercises)
- **Target**: Muscle group or exercise focus
- **Category**: Exercise classification (cardio, weightlifting, etc.)
- **Completion Status**: Real-time progress tracking

## Architecture

### Technology Stack
- **Language**: [Motoko](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/motoko/)
- **Platform**: [Internet Computer](https://internetcomputer.org/)
- **Development**: [DFX SDK](https://internetcomputer.org/docs/current/developer-docs/setup/install/)

### Data Structure
- **Storage**: HashMap-based efficient data storage
- **Identification**: Auto-incrementing unique ID system
- **Type Safety**: Strongly typed Motoko data structures

## Installation

### Prerequisites
- [DFX SDK](https://internetcomputer.org/docs/current/developer-docs/setup/install/) installed
- Internet Computer CLI tools configured

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd "ICP Final Project"
   ```

2. **Navigate to the project directory**
   ```bash
   cd Fitness_App
   ```

3. **Start the local Internet Computer replica**
   ```bash
   dfx start
   ```

4. **Deploy the canister**
   ```bash
   dfx deploy
   ```

## Usage

### Basic Operations

#### Add a New Exercise
```motoko
// Add a new exercise with all parameters
let exerciseId = await exercise_tracker.addExercise(
  "Push-ups",           // name
  3,                    // sets
  15,                   // reps
  null,                 // weight (null for bodyweight)
  "Chest, Triceps",     // target
  "Bodyweight"          // category
);
```

#### Mark Exercise as Completed
```motoko
// Mark exercise as completed
await exercise_tracker.completeExercise(exerciseId);
```

#### View All Exercises
```motoko
// Get formatted exercise list
let workout = await exercise_tracker.showExercises();
```

#### Clean Up Completed Exercises
```motoko
// Remove all completed exercises
await exercise_tracker.clearCompleted();
```

## API Reference

### Public Functions

| Function | Parameters | Return Type | Description |
|----------|------------|-------------|-------------|
| `getExercises()` | None | `[Exercise]` | Returns all exercises as an array |
| `addExercise()` | `name, sets, reps, weight, target, category` | `Nat` | Adds new exercise, returns ID |
| `completeExercise()` | `id: Nat` | `()` | Marks exercise as completed |
| `showExercises()` | None | `Text` | Returns formatted exercise list |
| `clearCompleted()` | None | `()` | Removes all completed exercises |

### Data Types

```motoko
type Exercise = {
  name: Text;        // Exercise name
  sets: Nat;         // Number of sets
  reps: Nat;         // Repetitions per set
  completed: Bool;   // Completion status
  weight: ?Nat;      // Optional weight
  target: Text;      // Target muscle group
  category: Text;    // Exercise category
};
```

### File Descriptions
- **`dfx.json`**: DFINITY Canister SDK configuration file
- **`main.mo`**: Core application logic and data structures
- **`README.md`**: Comprehensive project documentation

## Development

### Local Development
1. Start the local replica: `dfx start`
2. Deploy in development mode: `dfx deploy --mode=dev`
3. Test functions using the DFX console or Candid UI

### Testing
- Use the DFX console for interactive testing
- Access the Candid UI at `http://localhost:4943` (default port)
- Test all CRUD operations through the web interface

## Contributing

This project was developed as part of the Internet Computer internship bootcamp, demonstrating practical application of Motoko and the Internet Computer platform.

### Development Guidelines
- Follow Motoko best practices
- Maintain type safety
- Document public functions
- Test all functionality before deployment

## License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

---

**Built with Motoko on the Internet Computer**
