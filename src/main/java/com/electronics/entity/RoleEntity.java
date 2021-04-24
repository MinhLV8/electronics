package com.electronics.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "roles")
public class RoleEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany(mappedBy = "role")
    private Set<AccountEntity> account;

    public RoleEntity() {
    }

    public RoleEntity(long id, String name, Set<AccountEntity> account) {
        this.id = id;
        this.name = name;
        this.account = account;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<AccountEntity> getAccount() {
        return account;
    }

    public void setAccount(Set<AccountEntity> account) {
        this.account = account;
    }
}
