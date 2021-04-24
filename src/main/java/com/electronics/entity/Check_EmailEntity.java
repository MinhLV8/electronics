package com.electronics.entity;

import javax.persistence.*;

@Entity
@Table(name = "check_email")
public class Check_EmailEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String code;

    @ManyToOne
    @JoinColumn(name = "accountID")
    private AccountEntity account;

    public Check_EmailEntity() {
    }

    public Check_EmailEntity(Long id, String code, AccountEntity account) {
        this.id = id;
        this.code = code;
        this.account = account;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }
}
