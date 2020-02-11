import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

public class MainExecutor  {
    // global variables
    static String archive_drive_and_xampp_locator;
    static String archive_folder_name;
    static String xampp_drive_name_installed;
    static String xampp_folder_name_installed;
    static String full_archive_folder;
    static String xampp_on_drive_full_path;
    static String xampp_tomcat_services_container;


    public static void main(String[] args) throws java.io.IOException {
        // Get objects instances
        AppInstaller app_ins_instance = new AppInstaller();
        Properties prop = MainExecutor.getPropObject();
        Configer conf_object = new Configer();

        // XAMPP Install
        app_ins_instance.xamppInstaller(prop);

        String astronomy_folder_scr_full = full_archive_folder + prop.getProperty("astronomy_folder_name");
        String astronomy_folder_dest_full = xampp_on_drive_full_path + prop.getProperty("xampp_sites_container");
        // converting is needed
        File src_astronomy_folder = new File(astronomy_folder_scr_full);
        File dest_astronomy_folder = new File(astronomy_folder_dest_full);

        // Copy Astronomy folder
        conf_object.copyAstronomyFolder(src_astronomy_folder,dest_astronomy_folder);

        // create folder service container astronomylesson in tomcat folder
        conf_object.createFolderOnTomcat(xampp_on_drive_full_path);

        // copy services
        conf_object.moveServices();

        // copy libs
        conf_object.moveLibs();

        // copy web.xml
        conf_object.moveWebXml();

        System.out.println("XAMPP is installed and successfully configured");
    }

    static Properties getPropObject() throws java.io.IOException {
        Properties prop = new Properties();
        prop.load(new FileInputStream("data.properties"));
        return prop;
    }

}