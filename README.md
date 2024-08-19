# Extended_Kalman_Filter
ECE 9156 Project

# Project Overview

This project is part of the ECE 9156 course. It focus on simulating the movement of a robot (asumed as a mass point) along a circular trajectory using an Extended Kalman Filter (EKF). The EKF is used to estimate the position of the robot based on noisy measurements and the known dynamics of the system.

### Background

In this simulation, the robot moves in a circular path with a random angular velocity and a random radius. The X-coordinate of the robot is measured at regular intervals and the measurement is affected by assumed Gaussian noise. The EKF integrates model predictions and measurements to improve the accuracy of the position estimate over time.

### Simulation Details

- **State Variables**: The state of the robot is represented by its radius and angle.
- **Noise**: The simulation includes both process noise (affecting the robot's movement) and measurement noise (affecting the X-coordinate measurement).
- **Output**: The result is a plotted path of the robot. It shows the estimated trajectory compared to the true trajectory.

## File Structure

- **`main.m`**: The main script that sets up the simulation parameters, runs the EKF loop, and plots the robot's path.
- **`Extended_Kalman_Filter.m`**: A function that implements the EKF algorithm, performing the prediction and measurement update steps.

## How to Run

1. **Set Up the Environment**: Ensure you have MATLAB installed. This project does not require any additional toolboxes.

2. **Run the Simulation**:
   - Open MATLAB.
   - Navigate to the directory containing the project files.
   - Run the `main.m` script.

3. **View the Results**:
   - The simulation will produce a plot showing the estimated path of the robot using the EKF.
   - The center of the circular trajectory is also marked on the plot.

## Customization

- **Simulation Parameters**: You can modify the simulation parameters (e.g., total simulation time, measurement noise) directly in `main.m`.
- **Filter Tuning**: Adjust the process and measurement noise covariances in `Extended_Kalman_Filter.m` to see how they affect the filter's performance.
