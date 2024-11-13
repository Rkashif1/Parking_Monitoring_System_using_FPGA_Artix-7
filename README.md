# Parking Monitoring System Using FPGA (Artix-7)/PCB Designing

This project demonstrates a **Parking Monitoring System** implemented on an Artix-7 FPGA, designed to monitor parking spot occupancy and ensure safe parking operations. Using ultrasonic and infrared sensors, the system detects vehicle presence in each spot, with real-time status updates displayed on 7-segment displays and collision warnings triggered by a buzzer.

## Project Overview

The Parking Monitoring System leverages FPGA technology for real-time detection and monitoring of parking spaces. The FPGA processes data from multiple sensors to determine spot occupancy and prevent potential collisions. The system’s status is displayed in real-time, providing clear and accurate information on parking availability.

## Features

- **Real-Time Spot Monitoring:** Ultrasonic and infrared sensors track each parking spot’s occupancy, ensuring immediate detection of parked or vacant spaces.
- **Collision Warning System:** A buzzer alerts users to potential collisions, enhancing safety.
- **7-Segment Display for Status Updates:** Real-time parking status is displayed on multiple 7-segment displays, showing each spot’s availability.
- **Custom PCB-Level FPGA Peripheral Board:** A custom PCB board was specifically created for this project, providing a streamlined interface to connect sensors and displays directly to the FPGA. This board facilitates efficient data handling and output control, ensuring robust system performance.

## Hardware Components

- **Artix-7 FPGA:** The main controller, processing sensor inputs and managing display and buzzer outputs.
- **Ultrasonic Sensors:** Detect vehicles within parking spots, identifying occupancy.
- **Infrared Sensors:** Used for accurate vehicle detection and collision prevention.
- **7-Segment Displays:** Show each parking spot’s availability status in real-time.
- **Buzzer:** Provides an audible alert to warn against potential collisions.
- **Custom PCB Peripheral Board:** Created specifically for this project to interface the FPGA with sensors and displays, ensuring efficient data flow and control.

## Setup and Usage

1. **Hardware Setup:** Assemble the custom PCB with ultrasonic and infrared sensors connected to the Artix-7 FPGA. Configure connections to 7-segment displays and the buzzer on the PCB.
2. **FPGA Programming:** Upload the VHDL code to the FPGA for processing sensor inputs and managing output displays.
3. **Testing:** Run tests to verify real-time status display, spot detection, and collision warnings.
4. **Deployment:** Implement the system in a model parking lot setup to simulate real-world operations.

## Future Enhancements

- Integrate more advanced collision avoidance algorithms.
- Develop a mobile app to remotely monitor parking availability.
- Expand the system to manage larger parking structures.

## Team Collaboration

Each team member contributed to FPGA programming, PCB design, and sensor integration. Collaborative development ensured a robust and reliable parking monitoring solution with clear, real-time display and alerts.

## Conclusion

The Parking Monitoring System Using FPGA (Artix-7) demonstrates the use of FPGA for precise and real-time monitoring of parking spaces. With a custom PCB peripheral board specifically created for this project, collision warnings, and clear display output, this system enhances parking efficiency and safety.
