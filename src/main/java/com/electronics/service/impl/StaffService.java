package com.electronics.service.impl;

import com.electronics.entity.StaffEntity;
import com.electronics.repository.StaffRepository;
import com.electronics.service.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffService implements IStaffService {
    @Autowired
    private StaffRepository staffRepo;
    @Override
    public StaffEntity finByAccount_Id(long id){
        return staffRepo.findByAccount_Id(id);
    }
    @Override
    public StaffEntity findById(long id){
        return staffRepo.findById(id);
    }
    @Override
    public StaffEntity addStaff(StaffEntity staff){
        StaffEntity newStaff;
        try {
            newStaff = staffRepo.save(staff);
            return newStaff;
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }
    @Override
    public boolean deleteStaff(long id){
        boolean t = false;
        try {
            staffRepo.deleteById(id);
            t = true;
        }catch (Exception e){
            System.out.println(e);
        }
        return t;
    }
    @Override
    public List<StaffEntity> findByOrderByIdDesc(){
        List<StaffEntity> list;
        try {
            list = staffRepo.findByOrderByIdDesc();
            return list;
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }
    @Override
    public List<StaffEntity> findByNameOrUsernameLike(String name){
        name = "%"+ name +"%";
        return staffRepo.findByAccount_NameLikeOrAccount_UsernameLike(name,name);
    }
}
