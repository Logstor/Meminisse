# TODO

## Error on plugin installation

The error happens on DSF version 3.3 and DWC 3.2.

DSF output when installing the plugin:

"""

[debug] IPC#80: Received command InstallPlugin

[error] IPC#80: Failed to execute InstallPlugin
   System.ArgumentNullException: Value cannot be null. (Parameter 'key')
   at System.Collections.Generic.Dictionary`2.FindValue(TKey key)
   at System.Collections.Generic.Dictionary`2.ContainsKey(TKey key)
   at DuetAPI.ObjectModel.ModelObjectDictionary`1.ContainsKey(String key) in /home/pi/DuetSoftwareFramework/src/DuetAPI/ObjectModel/Base/ModelObjectDictionary.cs:line 172
   at DuetControlServer.Commands.InstallPlugin.Execute() in /home/pi/DuetSoftwareFramework/src/DuetControlServer/Commands/Plugins/InstallPlugin.cs:line 111
   at DuetAPI.Commands.Command.Invoke() in /home/pi/DuetSoftwareFramework/src/DuetAPI/Commands/BaseCommand.cs:line 46
   at DuetControlServer.IPC.Processors.Command.Process() in /home/pi/DuetSoftwareFramework/src/DuetControlServer/IPC/Processors/Command.cs:line 85
   
"""

# Notes