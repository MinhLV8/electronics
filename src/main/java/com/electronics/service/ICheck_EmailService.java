package com.electronics.service;

import com.electronics.entity.Check_EmailEntity;

import java.util.List;

public interface ICheck_EmailService {

    Check_EmailEntity addCode(Check_EmailEntity check_email);

    Check_EmailEntity check_Code(String code, long id);

    List<Check_EmailEntity> getAccountID(long id);

    boolean deleteCode(long id);
}
