# ICP Final Project - Motoko Fitness App: Track Your Workouts on the Internet Computer

## Overview

This project is a fitness application developed in Motoko as the final project for the Internet Computer internship bootcamp. It allows users to log, manage, and track their exercises, providing a comprehensive tool for monitoring their fitness journey. Built on the Internet Computer, this application showcases the ability to create decentralized and efficient applications.

## Features

*   **Detailed Exercise Logging:** Record exercise name, sets, reps, optional weight, target muscle group, and category (cardio, weightlifting, etc.).
*   **Exercise Management:** Add, edit, and remove exercises to customize your workout routines.
*   **Workout Overview:** View all recorded exercises in an organized format to assess progress.
*   **Completion Tracking:** Mark exercises as completed to track workout consistency.
*   **Efficient Cleanup:** Remove all completed exercises to keep your workout plan streamlined.

## Technical Details

*   **Language:** Motoko
*   **Platform:** Internet Computer
*   **Data Storage:** Utilizes `HashMap` for efficient exercise storage and retrieval.
*   **Unique Identifiers:** Employs a counter (`nextId`) to assign unique IDs to each exercise.

## Project Structure

*   `dfx.json`: Configuration file for the DFINITY Canister SDK.
*   `src/Fitness_App_backend/main.mo`: Main Motoko source code for the fitness app backend.
*   `README.md`: Project documentation (this file).

## Usage

To run this application, you will need the DFINITY Canister SDK installed. Follow the instructions in the SDK documentation to deploy the canister to the Internet Computer.

## Learning Experience

This project was developed as part of the Internet Computer internship bootcamp, demonstrating the skills and knowledge acquired during the program. It represents a practical application of Motoko and the Internet Computer platform.
