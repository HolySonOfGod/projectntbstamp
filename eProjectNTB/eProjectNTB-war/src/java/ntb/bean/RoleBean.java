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
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 * This class contains methods to operate with database on Roles table
 * @author Nhat Nguyen
 */
public class RoleBean {

    @EJB
    private AccountsFacade accountsFacade;
    @EJB
    private RolesFacade rolesFacade;
    private Roles role = new Roles();
    private int errors = 1;

    /** Creates a new instance of RoleBean */
    public RoleBean() {
    }

    /**
     * Retrieve a list of roles from Roles table in database
     * @return roles list, Type: java.util.List
     */
    public List<Roles> getListRole() {
        return this.rolesFacade.findAll();
    }

    /**
     * Retrieve a list of accounts from Accounts table in database.
     * We using that to check constraint on delete cascade between 2 tables are : Roles and Accounts
     * @return accounts list, Type: java.util.List
     */
    public List<Accounts> getListAccount() {
        return this.accountsFacade.findAll();
    }

    /**
     * Create a new role record in Roles table
     */
    public void createRole() {
        try {
            String rn = role.getRoleName();
            List<Roles> temp = getListRole();
            //Check and notify to Administrator that this role is existed or not
            for (int i = 0; i < temp.size(); i++) {
                if (rn.toString().trim().equals(temp.get(i).getRoleName().toString().trim())) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Role '" + role.getRoleName() + "' existed. Can't insert!!!");
            } else {
                this.rolesFacade.create(role);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "New role '" + role.getRoleName() + "' have been created successully!");
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: <b>Role name must is: "
                    + "'User, Administrator, or Moderator'.</b> " + ex.getMessage());
        }
    }

    /**
     * Update details for the role is existed in Roles table
     */
    public void updateRole() {
        this.role.setRoleID(Integer.parseInt(ThaoTacSession.layXuong("roleID").toString()));
        try {
            String rn = role.getRoleName();
            int rid = role.getRoleID();
            List<Roles> temp = getListRole();
            //Check and notify to Administrator that this role is existed or not
            for (int i = 0; i < temp.size(); i++) {
                if (rn.toString().trim().equals(temp.get(i).getRoleName().toString().trim()) && rid != (temp.get(i).getRoleID())) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Role '" + role.getRoleName() + "' existed. Try again!!!");
            } else {
                this.rolesFacade.edit(role);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Role '" + role.getRoleName() + "' updated successfully!");
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: <b>Role name must is: "
                    + "'User, Administrator, or Moderator'.</b> " + ex.getMessage());
        }
    }

    /**
     * Delete the role is existed in Roles table
     */
    public void deleteRole() {
        this.role = (Roles) ThaoTacSession.layXuong("role");
        try {
            int rID = this.getRole().getRoleID();
            List<Accounts> temp = this.getListAccount();
            //Check and notify to Administrator that this role is existed in Accounts table or not
            for (int i = 0; i < temp.size(); i++) {
                if (rID == temp.get(i).getRoles().getRoleID()) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Role '" + getRole().getRoleName() + "' is existing in child table. "
                        + "<font color='red'>Can't delete!!!</font>");
            } else {
                this.rolesFacade.remove(role);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You deleted role <b>'" + getRole().getRoleName() + "'</b>!");
            }
            ThaoTacSession.xoaGT("role");
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void setRoleToSession() {
        ThaoTacSession.duaGTLenSession("role", this.role);
    }

    public void setRoleIDToSession() {
        ThaoTacSession.duaGTLenSession("roleID", this.role.getRoleID());
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
}
