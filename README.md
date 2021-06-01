# Meminisse - The Data logging plugin

This plugin is used to continuously log the state of the machine.

## Tested Browsers

| Browser | Tested | Works |
| ------- | ------- | ------- |
| Chrome | Yes | Yes |
| Firefox | No | NaN |
| Safari | No | NaN |

## Guide

---

### Installation

1. Retrieve the compressed zip file, **Meminisse.zip**, from the github releases page: [releases](https://github.com/COBOD-International/Meminisse/releases)

2. In DWC go into the System tab, and press **UPLOAD SYSTEM FILES**

3. Choose **Meminisse.zip**, and go through the installation process

4. After installation the plugin should appear in the tab **Machine-Specific->Third-Party Plugins**

---

### Configuration file

The configuration file **MeminisseConfig.json** can be found and edited in the file explorer in the **System** tab.
From the **System Directory** the path is **COBOD/Meminisse/MeminisseConfig.json**.

The configuration can be changed at runtime, but this requires the plugin to be in the **idle state**. If the **ConsoleLogLevel** is 2 or below there will be a confirmation print in the DWC console that says: "**[Meminisse]: INFO: Refreshing Configuration**". <br>
If you need to confirm it's in the **idle state**, then you can set the **ConsoleLogLevel** to 1. More verbose prints will now be sent to the console e.g. **Entering {state}**, **Exiting {state}**.

| Property | Description|
| ------------ | -----------|
| ConsoleLogLevel | 0: Trace, 1: Debug, 2: Info(Default), 3: Warning, 4: Error |
| CSVDelimiter | What should delimit entities in the csv logfile? Default is ";" |
| LogsPrMin | How many log entries should we have pr. minute. Default is 60 log/min = 1 log/sec |
| FlushToFileEveryXLogs | How often should the log buffer be written to the log file? Default is every 10th we flush the buffer to log file. |
| IdleCheckPrMin | How often should we check if a print is started, when the machine is idle? Default is 30 check/min |
| LogWhilePaused | Keep logging when machine is paused? **true** or **false** |
| LogPosition | Log the position of the axis? **true** or **false** |
| LogPrintSpeed | Log the speed parameters? **true** or **false**|
| LogTime | Log print duration and pause duration? **true** or **false**|
| LogExtrusion | Log the extrusion factor? **true** or **false**|
| LogBaby | Log the Babystep of the z-axis? **true** or **false**|
| LogVoltages | Log the supply voltages of the mainboard? **true** or **false**|

---

### Use

When the installation is done, and the plugin is started as described in the **Installation** section, then the plugin just logs whenever the machine is processing GCode from a file.

**printComment**: Beware when adding a **printComment** to the logfile header, as this needs to be done while you aren't printing. If you do it while logging is active, then, upon save, you overwrite the file with what's in your editor, which doesn't contain all the data logged while you were writing the **printComment**.

You can see all the logs in the **Meminisse** tab. Here you'll see an ordered list of all the logs stored on the RPI. You can press **DOWNLOAD** or **DOWNLOAD ALL** to retrieve the file(s) for further analysis or **DELETE** to remove it from the RPI.

Use the **REFRESH** button to refresh the list. New logs won't appear by themselves.

---

### Log file

#### Header

The logfile contains this header, where you'll be able to see what configuration was used for this log, and what kind of GCode file was run.

#### Payload

The rest of the log file conforms to the csv format with semicolon( **;** ) as the default delimiter. This means the log files can be imported to and analysed in excel.

---

## Troubleshooting

- Prerequisites isn't fulfilled, super user plugin.
  
  - This is because Duet doesn't allow super user plugins as default. You need to ssh to the RPI, and type **sudo nano /opt/dsf/conf/config.json**. Use the nano text editor to change the value **RootPluginSupport** from **false** to **true**. Press **CTRL+O** to overwrite the file and **CTRL+X** to exit the editor. Now you probably have to reboot the RPI, and then this error is fixed.

- InvalidOperation DuetPluginService.

  - In v3.3 Duet introduced DuetPluginService which needs to run besides DuetControlServer and DuetWebServer. Run the following four case-sensitive commands to start and enable on start the following services.

    - sudo systemctl start duetpluginservice
    - sudo systemctl enable duetpluginservice
    - sudo systemctl start duetpluginservice-root
    - sudo systemctl enable duetpluginservice-root

---

## FAQ

Currently just write or call Alfred at arr@cobod.com.
