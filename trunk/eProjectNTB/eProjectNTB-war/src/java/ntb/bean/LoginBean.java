/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.AccountsFacade;
import BeanInfo.Accounts;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import Helpers.sendEmail;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 * This class using to check authentication user login
 * and authorization
 * @author Nhat Nguyen
 */
public class LoginBean {

    @EJB
    private AccountsFacade accountsFacade;
    private Accounts account = new Accounts();
    private String username, password, email, username1;

    /** Creates a new instance of LoginBean */
    public LoginBean() {
    }

    /**
     * Method check user account to login to system for administrator/moderator
     * @return
     */
    public String userLogin() {
        try {
            List<Accounts> listAccount = this.accountsFacade.findToLogin(username, password);
            for (Accounts acc : listAccount) {
                if (acc.getUsername().equals(username) && acc.getPassword().equals(password)) {
                    if (acc.getStatus() != true) {
                        Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Log in fail , this account isn't activated");
                        return null;
                    } else {
                        if (acc.getRoles().getRoleID().equals(1) || acc.getRoles().getRoleName().equals("Administrator")) {
                            ThaoTacSession.duaGTLenSession("ADMIN", getUsername());
                            return "accountpage";
                        } else if (acc.getRoles().getRoleID().equals(2) || acc.getRoles().getRoleName().equals("Moderator")) {
                            ThaoTacSession.duaGTLenSession("MOD", getUsername());
                            return "countrypage";
                        }
                    }
                }
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
        return "login";
    }

    /**
     * Method recovery password of user when they guess it
     * @return sent mail when finish
     */
    public void recoveryPassword() {
        try {
            List<Accounts> listAccount = this.accountsFacade.findToRecovery(username1, email);
            //System.out.println(username1+email);
            for (Accounts acc : listAccount) {
                if (acc.getUsername().equals(username1) && acc.getEmail().equals(email)) {
                    sendEmail.autoSendEmail(acc.getEmail().toString(), acc.getUsername().toString(), acc.getPassword().toString());
                    Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Email sent!");
                    //System.out.println(acc.getEmail().toString()+ acc.getUsername().toString()+ acc.getPassword().toString());
                } else {
                    Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "This account isn't activated");
                }
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Method check user account to login to system for user
     * @return
     */
    public String homeLogin() {
        try {
            List<Accounts> listAccount = this.accountsFacade.findToLogin(username, password);
            for (Accounts acc : listAccount) {
                if (acc.getUsername().equals(username) && acc.getPassword().equals(password)) {
                    if (acc.getStatus() != true) {
                        Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Log in fail , this account isn't activated");
                        return null;
                    } else {
                        Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Welcome back, '" + username + "'");
                        ThaoTacSession.duaGTLenSession("USER", getUsername());
                        return "userinfo";
                    }
                }
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
        return "login";
    }

    /**
     * Clear session of administrator/moderator logged in system
     * @return string to pagination
     */
    public String userLogout() {
        ThaoTacSession.xoaGT("MOD");
        ThaoTacSession.xoaGT("ADMIN");
        return "login";
    }

    /**
     * Clear session of user/customer logged in system
     * @return string to pagination
     */
    public String homeLogout() {
        ThaoTacSession.xoaGT("USER");
        ThaoTacSession.xoaGT("CUS");
        return "home";
    }

    /**
     * @return the account
     */
    public Accounts getAccount() {
        return account;
    }

    /**
     * @param account the account to set
     */
    public void setAccount(Accounts account) {
        this.account = account;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    public String getUsername1() {
        return username1;
    }

    public void setUsername1(String username1) {
        this.username1 = username1;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
