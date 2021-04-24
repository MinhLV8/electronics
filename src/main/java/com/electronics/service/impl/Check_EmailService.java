package com.electronics.service.impl;

import com.electronics.entity.Check_EmailEntity;
import com.electronics.repository.Check_EmailRepository;
import com.electronics.service.ICheck_EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Check_EmailService implements ICheck_EmailService {

    @Autowired
    private Check_EmailRepository check_emailRepo;

    @Override
    public Check_EmailEntity addCode(Check_EmailEntity check_email) {
        Check_EmailEntity newCode;
        try {
            newCode = check_emailRepo.save(check_email);
            return newCode;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Check_EmailEntity check_Code(String code, long id) {
        Check_EmailEntity newCode;
        try {
            newCode = check_emailRepo.findByCodeAndAccount_Id(code, id);
            return newCode;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Check_EmailEntity> getAccountID(long id) {
        List<Check_EmailEntity> newCode;
        try {
            newCode = check_emailRepo.findByAccount_Id(id);
            return newCode;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public boolean deleteCode(long id) {
        boolean t = false;
        try {
            check_emailRepo.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }
}
