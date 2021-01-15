using System;
using System.IO;
using System.Reflection.Metadata.Ecma335;
using System.Runtime.InteropServices;
using System.Windows.Controls;
using Microsoft.Win32;

namespace AdapterLib
{
    public class Adapter
    {
        public double A {get;set;}
        public double B {get;set;}

        public double Mul => A * B;
        public double Add => A + B;
        public double Sub => A - B;
        public double Div
        {
            get
            {
                GetLoggingPath();
                GetWpfControl();
                return A / B;
            }
        }

        private Control GetWpfControl()
        {
            Control c = new Button();
            return c;
        }

        private static string GetLoggingPath()
        {
            // Verify the code is running on Windows.
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                using (var key = Registry.CurrentUser.OpenSubKey(@"Software\Fabrikam\AssetManagement"))
                {
                    if (key?.GetValue("LoggingDirectoryPath") is string configuredPath)
                        return configuredPath;
                }
            }

            // This is either not running on Windows or no logging path was configured,
            // so just use the path for non-roaming user-specific data files.
            var appDataPath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
            return Path.Combine(appDataPath, "Fabrikam", "AssetManagement", "Logging");
        }
    }
}
