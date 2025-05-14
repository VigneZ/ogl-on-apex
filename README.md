# Oracle Guided Learning (OGL) on APEX

## What is APEX

Oracle APEX (Oracle Application Express) is a low-code application development platform developed by Oracle Corporation. It allows developers to build and deploy web, mobile, and desktop applications with a user-friendly, browser-based interface. APEX enables rapid application development with features like wizards, drag-and-drop layout builders, and property editors.

## What is Oracle Guided Learning (OGL)

Oracle Guided Learning (OGL) is a digital adoption platform that delivers in-application guidance, helping organizations adopt new products, processes, and policies. It's designed to simplify and accelerate the adoption of web-based applications by providing users with personalized, step-by-step, and contextual support within the application itself. OGL is a tool for training and change management, offering a way to communicate new updates, manage continuous change, and provide support to users as they need it.

## OGL on APEX

"OGL on APEX" is the Oracle APEX Plugin to enable the use of OGL on Oracle APEX Applications.

## Installation of Plug-In

+ Download the plugin "OGL on APEX" from [APEX World Plugin Page](https://apex.world/ords/r/apex_world/apex-world/plug-ins)

+ Import the Plugin for the Application from Shared Component -> Plugin

+ Create a Dynamic Action in the 0 - Global Page

+ Create a True Action with the Action "OGL on APEX [Plugin]"

+ In the "OGL Configuration" section, add the following

+ OGL APPID (Enter the appid from the OGL console for you application domain)

+ OGL Server Domain (Enter the OGL server details, defaulted to **guidedlearning.oracle.com**)

+ OGL User Tracking (**On**/Off)

+ OGL Environment (**Production**/Development

+ Save the settings

+ OGL on APEX is embedded

NOTES - You must obtain licensing for Oracle Guided Learning on APEX. To obtain a license please connect with the Oracle Customer Success Services, Oracle Guided Learning team (https://www.oracle.com/customer-success/)

For more details around using Oracle Guided Learning, please refer to our User Guide - https://docs.oracle.com/en/education/customer-success/guided-learning/user-guide/
## Contributing

Pull requests are welcome. For major changes, please open an issue first

to discuss what you would like to change.

## License

Please contact Oracle Customer Success Services, Oracle Guided Learning team to obtain a licence for usage of OGL on APEX. (https://www.oracle.com/customer-success/)
