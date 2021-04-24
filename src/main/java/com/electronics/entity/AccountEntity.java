package com.electronics.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Set;

@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "accounts")
public class AccountEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @NotBlank
    @Column(name = "name", length = 200)
    private String name;

    @Column(name = "username", nullable = false, unique = true, length = 50)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "createddate")
    @CreatedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime createdDate;

    @Column(name = "enabled", nullable = false, columnDefinition
            = "bit(1) default 1")
    private boolean enabled;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "account_role", joinColumns = @JoinColumn(name = "accountID", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "roleID", referencedColumnName = "id"))
    private Set<RoleEntity> role;

    @OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
    private List<OrderEntity> orderList;

    @OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
    private List<CommentsEntity> commentsList;

    @OneToOne(mappedBy = "account", fetch = FetchType.EAGER)
    private StaffEntity staff;

    @OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
    private List<Check_EmailEntity> check_email;

    public AccountEntity() {
    }

    public AccountEntity(Long id, String name, String username, String password, LocalDateTime createdDate, boolean enabled, Set<RoleEntity> role, List<OrderEntity> orderList, List<CommentsEntity> commentsList, StaffEntity staff, List<Check_EmailEntity> check_email) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.createdDate = createdDate;
        this.enabled = enabled;
        this.role = role;
        this.orderList = orderList;
        this.commentsList = commentsList;
        this.staff = staff;
        this.check_email = check_email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Set<RoleEntity> getRole() {
        return role;
    }

    public void setRole(Set<RoleEntity> role) {
        this.role = role;
    }

    public List<OrderEntity> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<OrderEntity> orderList) {
        this.orderList = orderList;
    }

    public List<CommentsEntity> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<CommentsEntity> commentsList) {
        this.commentsList = commentsList;
    }

    public StaffEntity getStaff() {
        return staff;
    }

    public void setStaff(StaffEntity staff) {
        this.staff = staff;
    }

    public List<Check_EmailEntity> getCheck_email() {
        return check_email;
    }

    public void setCheck_email(List<Check_EmailEntity> check_emailEntity) {
        this.check_email = check_emailEntity;
    }

    public String formatCreatedDate(){
        LocalDateTime localDateTime = createdDate;
        String s = localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        return s;
    }

}
