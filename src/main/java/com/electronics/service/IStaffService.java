package com.electronics.service;

import com.electronics.entity.StaffEntity;

import java.util.List;

public interface IStaffService {
    StaffEntity finByAccount_Id(long id);

    StaffEntity findById(long id);

    StaffEntity addStaff(StaffEntity staff);

    boolean deleteStaff(long id);

    List<StaffEntity> findByOrderByIdDesc();

    List<StaffEntity> findByNameOrUsernameLike(String name);
}
