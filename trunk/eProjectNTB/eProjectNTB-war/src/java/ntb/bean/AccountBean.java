/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.AccountsFacade;
import BeanCRUD.RolesFacade;
import BeanInfo.Accounts;
import BeanInfo.Roles;
import Helpers.CompareDate;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.model.SelectItem;

/**
 * This class contains methods to operate with database on Accounts table
 * @author Nhat Nguyen
 */
public class AccountBean {

    @EJB
    private RolesFacade rolesFacade;
    @EJB
    private AccountsFacade accountsFacade;
    private Accounts account = new Accounts();
    private Roles role = new Roles();
    private int roleID;
    private int errors = 1;
    private String firstName;
    private List accountList;

    /** Creates a new instance of AccountBean */
    public AccountBean() {        
        this.account.setGender(Boolean.TRUE);        
    }

    /**
     * Retrieve a list of accounts from Accounts table in database
     * @return roles list, Type: java.util.List
     */
    public List<Accounts> getListAccount() {
        return this.accountList = this.accountsFacade.findByFirstName(firstName);
    }

    /**
     * Get list account by criteria is account's first name and show on table
     * @return
     */
    public String searchAccount() {
        this.accountList = this.accountsFacade.findByFirstName(firstName);
        return null;
    }

    public String showAll() {
        this.setFirstName(null);
        this.accountList = this.accountsFacade.findByFirstName(firstName);
        return null;
    }

    /**
     * Get list role's name show in combo box
     * This helps Administrator operate easily
     * @return role's name list, Type: java.util.ArrayList
     */
    public ArrayList<SelectItem> getListRoleName() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<Roles> list = this.rolesFacade.findAll();
        for (Roles r : list) {
            SelectItem si = new SelectItem(r.getRoleID(), r.getRoleName());
            temp.add(si);
        }
        return temp;
    }

    /**
     * Create a new account record in Accounts table
     */
    public void createAccount() {
        try {
            CompareDate cd = new CompareDate();
            String uname = account.getUsername().trim();
            List<Accounts> temp = getListAccount();
            //Check to notify to Administrator that this user is existed or not
            for (int i = 0; i < temp.size(); i++) {
                if (uname.equals(temp.get(i).getUsername())) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (!cd.checkPhone(account.getPhone())) {
                this.errors = 2;
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Account with Username is '" + account.getUsername() + "' existed. Can't insert!!!");
            } else if (errors == 2) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Phone is number 8->20 characters. Can't insert!!!");
            } else {
                Roles rTemp = this.rolesFacade.find(this.roleID);
                this.account.setRoles(rTemp);
                this.account.setStatus(Boolean.TRUE);
                this.accountsFacade.create(account);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "New account '" + getAccount().getUsername()
                        + "' have been created successully!");                                
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Update details for the account is existed in Accounts table
     */
    public void updateAccount() {
        this.getAccount().setUsername(ThaoTacSession.layXuong("username").toString());
        try {
            if (this.getAccount().getUsername().equals("admin")) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Can't update users is <b>'admin'</b>!!!");
            } else {
                CompareDate cd = new CompareDate();
                if (!cd.checkPhone(account.getPhone())) {
                    Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Phone is number 8->20 characters. Can't insert!!!");
                } else {
                    //this.getAccount().setUsername(ThaoTacSession.layXuong("username").toString());
                    Roles rTemp = this.rolesFacade.find(this.roleID);
                    this.account.setRoles(rTemp);
                    this.accountsFacade.edit(account);
                    Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "The account '" + getAccount().getUsername()
                            + "' updated successfully ,Finish!");
                    this.setErrors(0);
                    ThaoTacSession.xoaGT("username");                    
                }
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Delete the account is existed in Accounts table
     */
    public void deleteAccount() {
        this.setAccount((Accounts) ThaoTacSession.layXuong("account"));
        ThaoTacSession.xoaGT("account");
        this.accountsFacade.remove(getAccount());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted account '" + getAccount().getUsername() + "'", "Finish!");
        this.setErrors(0);
    }

    public void setAccountToSession() {
        ThaoTacSession.duaGTLenSession("account", this.account);
    }

    public void setUsernameToSession() {
        ThaoTacSession.duaGTLenSession("username", this.account.getUsername());
    }

    public void setRoleIDToSession() {
        ThaoTacSession.duaGTLenSession("roleID", this.roleID);
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

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
}
