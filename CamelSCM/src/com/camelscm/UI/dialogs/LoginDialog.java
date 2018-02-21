/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.camelscm.UI.dialogs;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;
import org.junit.Test;

/**
 *
 * @author salim
 */
public class LoginDialog extends Stage {

    public LoginDialog() throws IOException {
        setTitle("Camel Flour Supply Chain Management - System Login");
        initModality(Modality.APPLICATION_MODAL);
        setResizable(false);
        setAlwaysOnTop(true);
        Parent root = FXMLLoader.load(getClass().getResource("/com/camelscm/UI/FXML/loginDialog.fxml"));
        Scene scene = new Scene(root);
        setScene(scene);
        show();
    }

}
