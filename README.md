# LuxOS Fan Speed Adjustment for the Altair BitChimney 

This repository provides a Postman collection and environment configuration to automate the adjustment of the `power_off_speed` parameter on the [Altair BitChimney](https://altairtech.io/product/bitchimney/) Bitcoin mining space heater.

## Overview

The Postman collection includes the following requests:

1. **Logon**: Initiates a session with the BitChimney device.
2. **Set Fan Speed**: Adjusts the `power_off_speed` parameter to the desired value.
3. **Logoff**: Terminates the session with the device.

These requests are designed to be executed sequentially to ensure secure and efficient parameter adjustment.

## Prerequisites

- **Postman**: Install Postman from the [official website](https://www.postman.com/downloads/).

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/marsmensch/AltairBitcoinChimneyFans.git
   cd luxos-fan-adjustment
   ```

2. **Import the Postman Collection and Environment**:
   - Open Postman.
   - Click the **"Import"** button.
   - Select the `LuxOS_Fan_Speed_Adjustment.postman_collection.json` file from the cloned repository.
   - Navigate to the **"Environments"** tab in Postman.
   - Click the **"Import"** button.
   - Select the `LuxOS_Miner_Environment.postman_environment.json` file.

3. **Configure Environment Variables**:
   - In Postman, go to the **"Environments"** section.
   - Select the **"LuxOS Miner Environment"**.
   - Update the `MINER_IP` variable to the IP address of your BitChimney device.
   - Ensure the `SessionID` variable is present but leave its value empty; it will be populated automatically during the logon process.
   - Save the environment and set it as active.

## Usage

1. **Run the Collection**:
   - In Postman, click on the **"Runner"** button.
   - Select the **"LuxOS Fan Speed Adjustment"** collection.
   - Choose the **"LuxOS Miner Environment"**.
   - Click **"Start Run"** to execute the sequence.

2. **Verify Execution**:
   - After completion, review the responses to ensure that each step was successful.
   - Confirm that the `power_off_speed` parameter has been adjusted to the desired value.

## Notes

- The default API port for the BitChimney device is `4028`. Ensure that this port is accessible and not blocked by any firewall settings.
- Handle the `SessionID` securely; it is used to authenticate sessions with the device.
- For more information about the Altair BitChimney, visit the [official product page](https://altairtech.io/product/bitchimney/).

## Support

For product assistance, please refer to the [Altair Technology Support Page](https://altairtech.io/contact-us/).
