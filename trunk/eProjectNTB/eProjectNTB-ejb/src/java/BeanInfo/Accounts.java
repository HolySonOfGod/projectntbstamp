/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanInfo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.validator.constraints.*;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "Accounts")
@NamedQueries({
    @NamedQuery(name = "Accounts.findAll", query = "SELECT a FROM Accounts a"),
    @NamedQuery(name = "Accounts.findByUsername", query = "SELECT a FROM Accounts a WHERE a.username = :username"),
    @NamedQuery(name = "Accounts.findByPassword", query = "SELECT a FROM Accounts a WHERE a.password = :password"),
    @NamedQuery(name = "Accounts.findByFirstName", query = "SELECT a FROM Accounts a WHERE a.firstName LIKE :firstName"),
    @NamedQuery(name = "Accounts.findByLastName", query = "SELECT a FROM Accounts a WHERE a.lastName = :lastName"),
    @NamedQuery(name = "Accounts.findByEmail", query = "SELECT a FROM Accounts a WHERE a.email = :email"),
    @NamedQuery(name = "Accounts.findByPhone", query = "SELECT a FROM Accounts a WHERE a.phone = :phone"),
    @NamedQuery(name = "Accounts.findByAddress", query = "SELECT a FROM Accounts a WHERE a.address = :address"),
    @NamedQuery(name = "Accounts.findByBirthday", query = "SELECT a FROM Accounts a WHERE a.birthday = :birthday"),
    @NamedQuery(name = "Accounts.findByGender", query = "SELECT a FROM Accounts a WHERE a.gender = :gender"),
    @NamedQuery(name = "Accounts.findByStatus", query = "SELECT a FROM Accounts a WHERE a.status = :status"),
    @NamedQuery(name = "Accounts.findToLogin", query = "SELECT u FROM Accounts u WHERE u.username = :username and u.password = :password"),
    @NamedQuery(name = "Accounts.findContract", query = "SELECT a FROM Accounts a WHERE a.roles = :roles"),
    @NamedQuery(name = "Accounts.findToRecovery", query = "SELECT u FROM Accounts u WHERE u.username = :username and u.email = :email")})
public class Accounts implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Username")
    @NotEmpty(message = "Username can't be empty")
    @Length(max = 50, message = "Username has maximum 50 characters")
    private String username;
    @Basic(optional = false)
    @Column(name = "Password")
    @NotEmpty(message = "Password can't be empty")
    @Length(max = 100, min = 6, message = "Password has minimum 6 and maximum 100 characters")
    private String password;
    @Basic(optional = false)
    @Column(name = "FirstName")
    @NotEmpty(message = "First name can't be empty")
    @Length(max = 50, message = "First name has maximum 50 characters")
    private String firstName;
    @Basic(optional = false)
    @Column(name = "LastName")
    @NotEmpty(message = "Last name can't be empty")
    @Length(max = 150, message = "Last name has maximum 150 characters")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "Email")
    @NotEmpty(message = "Email can't be empty")
    @Length(max = 100, message = "Email has maximum 100 characters")
    @Email(message = "Invalid email (eg: yourname@email.com)")
    private String email;
    @Column(name = "Phone")
    @Length(max = 20, message = "Phone number has maximum 20 characters")
    private String phone;
    @Column(name = "Address")
    private String address;
    @Column(name = "Birthday")
    @Temporal(TemporalType.TIMESTAMP)
    private Date birthday;
    @Column(name = "Gender")
    private Boolean gender;
    @Column(name = "Status")
    private Boolean status;
    @JoinColumn(name = "RoleID", referencedColumnName = "RoleID")
    @ManyToOne
    private Roles roles;
    @OneToMany(mappedBy = "accounts")
    private List<Contracts> contractsList;
    @OneToMany(mappedBy = "accounts")
    private List<Articles> articlesList;

    public Accounts() {
    }

    public Accounts(String username) {
        this.username = username;
    }

    public Accounts(String username, String password, String firstName, String lastName, String email) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    public List<Contracts> getContractsList() {
        return contractsList;
    }

    public void setContractsList(List<Contracts> contractsList) {
        this.contractsList = contractsList;
    }

    public List<Articles> getArticlesList() {
        return articlesList;
    }

    public void setArticlesList(List<Articles> articlesList) {
        this.articlesList = articlesList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Accounts)) {
            return false;
        }
        Accounts other = (Accounts) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Accounts[username=" + username + "]";
    }
}
