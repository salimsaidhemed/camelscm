/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.camelscm.utils;

import java.io.File;

/**
 *
 * @author Salim Said Hemed
 * @version 0.1
 * @description Program Startup Procedures:
 * <h1>Order of Initialization</h1>
 * <li>
 * <ol></ol>
 * </li>
 * 
 */
public class Startup {
    /**
     * <h1>Checks if a Database exists.</h1> 
     * Can be used to determine if the database, 
     * if not it can be created by the system
     * <h2>Usage : </h2>
     * <code>if (databaseExists()){} </code>
     * @return boolean 
     * 
     */
    private boolean databaseExists(){
        File file = new File("Database");
        if (!file.exists() || !file.isDirectory()){
            return false;
        }
        else {
            return true;
        }
    }
    /**
     * 
     */
    public void startupProcedures(){
        if (!databaseExists()){
        
        }
        else {
        
        }
    }
}
