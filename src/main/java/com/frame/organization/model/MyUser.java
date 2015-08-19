package com.frame.organization.model;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: ming
 * Date: 13-3-6
 * Time: 下午2:16
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "organization_user")
public class MyUser implements Serializable, UserDetails {

    private String id;
    private String username;
    private String name;
    private String password;
    private Integer utype;           // 基础岗位  专家 助理 客户
    private Integer theStatus;      // 0假删
    private Integer checkStatus;
    private BigDecimal balance;
    private String confirmPassword;
    private String oldPassword;
    private Date lastLogintime;
    private boolean enabled;               //是否可用
    private boolean accountExpired;       //账号过期
    private boolean accountLocked;        //账号锁定
    private boolean credentialsExpired;  //证书过期
    private String navName;

    private Integer roleType;


    public MyUser() {
    }

    @Column(name = "utype")
    public Integer getUtype() {
        return utype;
    }

    public void setUtype(Integer utype) {
        this.utype = utype;
    }

    @Id
    @GenericGenerator(name = "id", strategy = "com.frame.core.p.model.ZJHidGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "thestatus")
    public Integer getTheStatus() {
        return theStatus;
    }

    public void setTheStatus(Integer theStatus) {
        this.theStatus = theStatus;
    }
    @Column(name = "is_enabled")
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Column(name = "is_account_expired")
    public boolean isAccountExpired() {
        return accountExpired;
    }

    public void setAccountExpired(boolean accountExpired) {
        this.accountExpired = accountExpired;
    }

    @Column(name = "is_account_locked")
    public boolean isAccountLocked() {
        return accountLocked;
    }

    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }

    @Column(name = "is_credentials_expired")
    public boolean isCredentialsExpired() {
        return credentialsExpired;
    }

    public void setCredentialsExpired(boolean credentialsExpired) {
        this.credentialsExpired = credentialsExpired;
    }
    @Column(name="role_type")
    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }
    @Column(name="last_login_time")
    public Date getLastLogintime() {
        return lastLogintime;
    }

    public void setLastLogintime(Date lastLogintime) {
        this.lastLogintime = lastLogintime;
    }
    @Column(name="check_status")
    public Integer getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(Integer checkStatus) {
        this.checkStatus = checkStatus;
    }

    @Column(name="balance")
    public BigDecimal getBalance() {
        if(balance==null){
            return new BigDecimal(0);
        }
        return balance;

    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    @JsonIgnore
    @Transient
    public Collection<GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> gList = new ArrayList<GrantedAuthority>();
        Permission permission = new Permission();//每个用户都默认带ROLE_USER这个权限
        permission.setAuthority("ROLE_USER");//普通用户
        gList.add(permission);
        return gList;
    }

    @Transient
    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    @Transient
    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    @Transient
    public boolean isAccountNonExpired() {
        return !isAccountExpired();
    }

    @Transient
    public boolean isAccountNonLocked() {
        return !isAccountLocked();
    }

    @Transient
    public boolean isCredentialsNonExpired() {
        return !credentialsExpired;
    }

    @Transient
    public String getFullName() {
        return this.name + "[" + this.username + "]";
    }

    @Override
    public String toString() {
        return "User{id = " + id + ", username = " + username + "}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + username.hashCode();
        return result;
    }
    @Transient
    public String getNavName() {
        if(name!=null&&!name.equals(""))
            return name;
        else
            return username;
    }


}
