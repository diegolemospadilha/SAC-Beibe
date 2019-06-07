package com.beibe.sac.facade;

import com.beibe.sac.DAO.UsuarioDAO;
import com.beibe.sac.model.Usuario;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

/**
 *
 * @author lemospadilha
 */
public class UsuarioFacade {
    private static final UsuarioDAO usuarioDAO = new UsuarioDAO();
      
    public static String criptografarSenha(String senha) throws UnsupportedEncodingException, NoSuchAlgorithmException{
       MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
       byte messageDigest[] = algorithm.digest(senha.getBytes("UTF-8"));
         
       StringBuilder hexString = new StringBuilder();
       for (byte b : messageDigest) {
         hexString.append(String.format("%02X", 0xFF & b));
       }
       String senhahex = hexString.toString();
        
       System.out.println(senhahex);
       return senhahex;
    }

    public static Usuario buscarPorId(int id, String cliente) throws SQLException {
       Usuario usuario = usuarioDAO.findById(id, cliente);
       return usuario;
    }

    public static void inserir(Usuario user, String tipoUsuario) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
       usuarioDAO.insert(user, tipoUsuario);
    }

    public static int alterar(Usuario user, String tipoUsuario) {
        if(usuarioDAO.alterar(user, tipoUsuario) == 0){
            return 0;
        } else{
            return 1;
        }
    }
}
