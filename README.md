# IoT Farm

## Overview

The IoT Farm Project is a monitoring and automation system designed for hydroponic farming, utilizing AWS and Terraform. The system uses Arduino-connected sensors and actuators to create an intelligent environment for plant growth, with cloud-based data collection, analysis, and visualization. The project aims to optimize farming conditions and improve yield through real-time insights and automation.

### Key Components

- **AWS IoT Core**: Manages MQTT communication between sensors, actuators, and the cloud.
- **Amazon Timestream**: Stores time-series data from IoT sensors for analysis.
- **AWS Lambda**: Processes incoming sensor data and triggers actions based on conditions.
- **Amazon Kinesis**: Real-time stream processing for monitoring data in real time.
- **Amazon SNS**: Sends alerts via email or SMS when certain conditions are met.
- **Amazon CloudWatch**: Monitors the performance of AWS services and manages logs.
- **AWS IoT SiteWise**: Provides a digital copy of assets for monitoring and analytics.
- **AWS IAM**: Manages permissions and access controls for all resources.
- **AWS Elastic Beanstalk**: Hosts the Node.js frontend for visualizing data and controlling devices.
- **Arduino**: Collects data from sensors and transmits it to AWS IoT Core.

## Prerequisites

- **Terraform (v1.0+)**: Infrastructure-as-Code tool to manage and deploy AWS resources.
- **AWS CLI (v2.0+)**: For configuring AWS credentials locally.
- **Docker**: Required if deploying Node.js frontend using Docker on Elastic Beanstalk.
- **Node.js (v14+)**: For running frontend server locally if needed.
- **Arduino**: Required for collecting sensor data.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Peyton7890/IoT_Farm.git
   cd IoT_Farm

## Project Usage

### Data Collection

- **Sensors**: Arduino collects data from connected sensors and publishes it to AWS IoT Core.
- **IoT Core Rules**: Routes incoming data to services such as Timestream, Lambda, and Kinesis for processing.

### Data Processing and Automation

- **AWS Lambda**: Processes data and triggers actions based on sensor conditions (e.g., watering when soil moisture is low).
- **Kinesis**: Real-time data processing for immediate insights and dashboard updates.

### Alerts

- **Amazon SNS**: Sends notifications (e.g., email/SMS) if sensor values exceed thresholds, based on CloudWatch Alarms.

### Visualization and Control

- **Elastic Beanstalk**: Access the Node.js frontend hosted for live data views and controls.
- **AWS IoT SiteWise**: Monitor asset status
