import java.util.Scanner;
import java.util.Properties;

public class AppInstaller {

    // load xampp installer
    void xamppInstaller(Properties prop_instance) {
        String full_xampp_installer_path;
        Scanner user_input = new Scanner(System.in);
        // get driver name
        System.out.println("Enter drive name where you saved XAMPP:(example C:\\)");
        MainExecutor.archive_drive_and_xampp_locator = user_input.nextLine();
        // get folder name
        System.out.println("Write folder name where you saved archive: ");
        MainExecutor.archive_folder_name = user_input.nextLine() + "\\";


        full_xampp_installer_path = MainExecutor.archive_drive_and_xampp_locator +
                                    MainExecutor.archive_folder_name + prop_instance.getProperty("xampp_file_name");


        MainExecutor.full_archive_folder = MainExecutor.archive_drive_and_xampp_locator +
                MainExecutor.archive_folder_name;

        // run xampp installer
        try {
            Process xampp_installer_prc = new ProcessBuilder(full_xampp_installer_path).start();
        } catch(java.io.IOException e) {
            e.printStackTrace();
        }

        // write global variables after installation
        System.out.println("Enter drive name where did you install XAMPP:(example C:\\) after XAMPP installed");
        MainExecutor.xampp_drive_name_installed = user_input.nextLine();

        System.out.println("Write folder name where did you install XAMPP:");
        MainExecutor.xampp_folder_name_installed = user_input.nextLine();


        MainExecutor.xampp_on_drive_full_path = MainExecutor.xampp_drive_name_installed +
                                                MainExecutor.xampp_folder_name_installed + "\\";

    }
}