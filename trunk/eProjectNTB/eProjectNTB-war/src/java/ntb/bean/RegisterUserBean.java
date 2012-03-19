/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.AccountsFacade;
import BeanCRUD.RolesFacade;
import BeanInfo.Accounts;
import BeanInfo.Roles;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import Helpers.sendEmail;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 *
 * @author Nhat Nguyen
 */
public class RegisterUserBean {

    @EJB
    private AccountsFacade accountsFacade;
    @EJB
    private RolesFacade rolesFacade;
    private Accounts account = new Accounts();
    private Roles role = new Roles();
    private int roleID;
    private int errors = 1;

    /** Creates a new instance of RegisterUserBean */
    public RegisterUserBean() {
        this.account.setGender(Boolean.TRUE);
        this.roleID = 5;
    }

    public List<Accounts> getListUser() {
        return this.accountsFacade.findAll();
    }

    public List<Accounts> getListUserByUsername() {
        return this.accountsFacade.findByUsername(ThaoTacSession.layXuong("USER").toString());
    }

    /**
     * Register new user
     * @return new account, send mail when finish
     */
    public String registerUser() {
        String uname = account.getUsername();
        List<Accounts> temp = getListUser();
        //Check to notify to User that this user is existed or not
        for (int i = 0; i < temp.size(); i++) {
            if (uname.equals(temp.get(i).getUsername())) {
                this.setErrors(1);
                break;
            } else {
                this.setErrors(0);
            }
        }
        if (getErrors() == 1) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Username is '" + account.getUsername() + "' existed. Can't insert!!!");
            return "register";
        } else {
            Roles rTemp = this.rolesFacade.find(this.getRoleID());
            this.account.setRoles(rTemp);
            this.account.setStatus(Boolean.TRUE);
            this.accountsFacade.create(account);
            sendEmail.autoSendEmail(account.getEmail(), account.getUsername(), account.getPassword());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Thanks for your registration, " + getAccount().getUsername() + "!");
            ThaoTacSession.duaGTLenSession("USER", account.getUsername());
            return "userinfo";
        }

    }

    public String UpdateUser() {
        String uname = account.getUsername();
        List<Accounts> temp = getListUser();
        //Check to notify to User that this user is existed or not
        this.account.setUsername(ThaoTacSession.layXuong("USER").toString());
        Roles rTemp = this.rolesFacade.find(this.getRoleID());
        this.account.setRoles(rTemp);
        this.account.setStatus(Boolean.TRUE);
        this.accountsFacade.edit(account);
        sendEmail.autoSendEmail(account.getEmail(), account.getUsername(), account.getPassword());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Thanks for your registration, " + getAccount().getUsername() + "!");
        ThaoTacSession.duaGTLenSession("USER", account.getUsername());
        return "userinfo";
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
     * @return the errors
     */
    public int getErrors() {
        return errors;
    }

    /**
     * @param errors the errors to set
     */
    public void setErrors(int errors) {
        this.errors = errors;
    }

    /**
     * @return the role
     */
    public Roles getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(Roles role) {
        this.role = role;
    }

    /**
     * @return the roleID
     */
    public int getRoleID() {
        return roleID;
    }

    /**
     * @param roleID the roleID to set
     */
    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
}
