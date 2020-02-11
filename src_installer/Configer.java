import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.nio.file.Path;
import java.util.Properties;
import java.io.FilenameFilter;



public class Configer {
    // move astronomy folder
    void copyAstronomyFolder(File source, File dest) throws IOException {
        Configer.move(source, dest);
    }

    static void move(File sourceFile, File destFile) throws IOException {
        Path source = sourceFile.toPath();
        Path newdir = destFile.toPath();
        Files.move(source, newdir.resolve(source.getFileName()),
                StandardCopyOption.REPLACE_EXISTING);

    }

    // create folder name astronomylesson in Tomcat
    void createFolderOnTomcat(String xampp_on_local_drive) throws java.io.IOException {

        // create properties object
        Properties prp = MainExecutor.getPropObject();

        // create folder
        File astr_srv_folder = new File(xampp_on_local_drive + prp.getProperty("xampp_tomcat_services_folder_path")
                              + prp.getProperty("xampp_tomcat_services_folder"));
        astr_srv_folder.mkdir();

        // define global variable
        MainExecutor.xampp_tomcat_services_container = xampp_on_local_drive +
                               prp.getProperty("xampp_tomcat_services_folder_path") +
                               prp.getProperty("xampp_tomcat_services_folder");
    }


    void moveServices() throws IOException {

        Properties prp_copy = MainExecutor.getPropObject();

        // get only .class files
        File[] class_files = this.getClassExst();

        // convert into File
        File dest_f = new File(MainExecutor.xampp_tomcat_services_container);

        // move files
        for (File i : class_files) {
            Configer.move(i,dest_f);
          }
        }


         File[] getClassExst() throws IOException {

            Properties prp_select_class = MainExecutor.getPropObject();

            String dirName = MainExecutor.full_archive_folder + prp_select_class.getProperty("service_folder_on_hdd_from_arch");

            File dir = new File(dirName);

            return dir.listFiles(new FilenameFilter() {
                public boolean accept(File dir, String filename)
                { return filename.endsWith(".class"); }
            } );
        }


           File[] getJarExst() throws IOException {

            Properties prp_select_jar = MainExecutor.getPropObject();

            String dirName = MainExecutor.full_archive_folder + prp_select_jar.getProperty("libs_folder_on_hdd_from_arch");

            File dir = new File(dirName);

            return dir.listFiles(new FilenameFilter() {
                     public boolean accept(File dir, String filename)
                     { return filename.endsWith(".jar"); }
                 } );
         }


         void moveLibs() throws IOException {

             Properties prp_copy = MainExecutor.getPropObject();

             // get only .jar files
             File[] lib_files = this.getJarExst();

             String dest_f_libs_str = MainExecutor.xampp_drive_name_installed + MainExecutor.xampp_folder_name_installed +
                                  prp_copy.getProperty("libs_folder_on_hdd");

             // convert into File
             File dest_f = new File(dest_f_libs_str);

             // move files
             for (File i : lib_files) {
                 Configer.move(i,dest_f);
             }
         }



        File[] getXml() throws IOException {

            Properties prp_select_xml = MainExecutor.getPropObject();

            String dirName = MainExecutor.full_archive_folder + prp_select_xml.getProperty("libs_folder_on_hdd_from_arch");

            File dir = new File(dirName);

            return dir.listFiles(new FilenameFilter() {
                public boolean accept(File dir, String filename)
                { return filename.endsWith(".xml"); }
            } );
        }

        void moveWebXml()  throws IOException {

            Properties prp_copy = MainExecutor.getPropObject();

            // get only .jar files
            File[] xml_files = this.getXml();

            String dest_f_libs_str = MainExecutor.xampp_drive_name_installed + MainExecutor.xampp_folder_name_installed +
                    prp_copy.getProperty("web_xml_folder_on_hdd");

            // convert into File
            File dest_f = new File(dest_f_libs_str);

            // move files
            for (File i :xml_files) {
                Configer.move(i,dest_f);
            }
        }

}