# Random-Walk-Meeting-Probability

This MATLAB project simulates a **random walk** on a **10x10 grid** with two independent moving agents. The goal is to analyze the probability of two people meeting based on their random trajectories, including a scenario where one person's trajectory is slightly shifted.

## Features
- **Random Walk Simulation**: Two individuals move randomly within a 10x10 grid.
- **Monte Carlo Trials**: Simulates 500 trials with 1000 time steps per trial.
- **Meeting Probability Analysis**: Computes the probability of the two individuals meeting before and after introducing a shift.
- **Visual Representation**: Plots movement trajectories and meeting points.

## How It Works
1. Two individuals (Person A and Person B) start at random positions.
2. Each individual takes random steps (up, down, left, or right).
3. The meeting probability is recorded before and after shifting Person A's trajectory.
4. Results are displayed in the console and visualized on a grid.

## Simulation Parameters
| Parameter      | Description                          | Default Value |
|---------------|--------------------------------------|--------------|
| `N`           | Grid size                           | 10x10        |
| `T`           | Time steps per trial                | 1000         |
| `trials`      | Number of simulation trials         | 500          |

## Visualization
- **Blue Line**: Path of Person A  
- **Red Line**: Path of Person B  
- **Green Dots**: Meeting points  
- **Black Dots**: Missed meetings (due to trajectory shift)  

## Probability Calculations
After running the simulation, the program outputs:
- **Probability of Meeting Before Shift**
- **Probability of Meeting After Shift**
- **Missed Meeting Probability**

## Running the Code
1. Open MATLAB.
2. Copy the code into a new script or run it directly in the command window.
3. Execute the script to visualize and compute meeting probabilities.

## Example Output
