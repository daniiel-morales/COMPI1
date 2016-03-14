
import java.io.File;
public class GeneradorAnalizadores {
	public static void main(String[] args) 
    {
        generarLexico("src/Lexico.jflex");
        generarSintactico("src/Sintactico.cup","Simbolos","Sintactico");
    }    
    public static void generarLexico(String path)
    {
        jflex.Main.generate(new File(path));
    }
    public static void generarSintactico(String path,String nombre1, String nombre2){
    	String opciones[] = new String[7]; 
       opciones[0] = "-destdir";
       opciones[1] = "src/";
       opciones[2] = "-symbols"; 
       opciones[3] = nombre1;
       opciones[4] = "-parser";         
       opciones[5] = nombre2; 
       opciones[6] = path; 
       try {
            java_cup.Main.main(opciones);
       }catch (Exception ex){System.out.print(ex);}        
    }   
}
