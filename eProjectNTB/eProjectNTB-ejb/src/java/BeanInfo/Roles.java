/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanInfo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "Roles")
@NamedQueries({
    @NamedQuery(name = "Roles.findAll", query = "SELECT r FROM Roles r"),
    @NamedQuery(name = "Roles.findByRoleID", query = "SELECT r FROM Roles r WHERE r.roleID = :roleID"),
    @NamedQuery(name = "Roles.findByRoleName", query = "SELECT r FROM Roles r WHERE r.roleName = :roleName"),
    @NamedQuery(name = "Roles.findByDescription", query = "SELECT r FROM Roles r WHERE r.description = :description")})
public class Roles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id    
    @Basic(optional = false)
    @Column(name = "RoleID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer roleID;
    @Basic(optional = false)
    @Column(name = "RoleName")
    @NotEmpty(message = "Role name can't be empty")
    @Length(max = 100, message = "Role name has maximum 100 characters")
    private String roleName;
    @Column(name = "Description")
    @Length(max = 200, message = "Description has maximum 200 characters")
    private String description;
    @OneToMany(mappedBy = "roles")
    private List<Accounts> accountsList;

    public Roles() {
    }

    public Roles(Integer roleID) {
        this.roleID = roleID;
    }

    public Roles(Integer roleID, String roleName) {
        this.roleID = roleID;
        this.roleName = roleName;
    }

    public Integer getRoleID() {
        return roleID;
    }

    public void setRoleID(Integer roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Accounts> getAccountsList() {
        return accountsList;
    }

    public void setAccountsList(List<Accounts> accountsList) {
        this.accountsList = accountsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roleID != null ? roleID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Roles)) {
            return false;
        }
        Roles other = (Roles) object;
        if ((this.roleID == null && other.roleID != null) || (this.roleID != null && !this.roleID.equals(other.roleID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Roles[roleID=" + roleID + "]";
    }
}
