import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JButton;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.StringReader;


public class Form extends JFrame{
	
	Form(){
		super("Tarea4_201314810");
	
		JPanel panel = new JPanel();
		getContentPane().add(panel, BorderLayout.CENTER);
		panel.setLayout(null);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(0, 0, 450, 150);
		
		final JTextArea txt = new JTextArea();
		scrollPane.setViewportView(txt);
		
		panel.add(scrollPane);
		
		JButton btnCrearAst = new JButton("Crear AST");
		btnCrearAst.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				initAnalisis(txt.getText());
			}
		});
		btnCrearAst.setBounds(174, 172, 99, 24);
		panel.add(btnCrearAst);
	}
	public void initAnalisis(String txt){
		Lexico analizador_lexico =  new Lexico(new StringReader(txt));
		Sintactico analizador_sintactico = new Sintactico(analizador_lexico);       
	    try {
			analizador_sintactico.parse();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//javax.swing.JOptionPane.showMessageDialog(null,txt);
	}

	public static void main(String[] args) {
		Form start = new Form();
		start.setLocationRelativeTo(null);
		start.setSize(450,250);
		start.setResizable(false);
		start.setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
		start.setVisible(true);
	}
}
