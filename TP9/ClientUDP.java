import java.io.*;
import java.net.*;

public class ClientUDP
{
	public static void main( String[] args )
	{
		try
		{
			InetAddress addr = InetAddress.getLocalHost();
			System.out.println( "adresse = " +addr.getHostName() );

			// Déclaration et initialisation de la variable data
		    String s = "Phrase de test";
		    byte[] data = s.getBytes();

			DatagramPacket packet = new DatagramPacket( data, data.length, addr, 1234 );
			DatagramSocket sock = new DatagramSocket();
			sock.send(packet);
			sock.receive(packet);
			String str = new String(packet.getData());
			System.out.println("Chaine recu par le serveur = " + str);
			sock.close();
		}
		catch ( Exception ex )
			{
				System.out.println ( "Erreur!" ) ;
			}
	}
}


