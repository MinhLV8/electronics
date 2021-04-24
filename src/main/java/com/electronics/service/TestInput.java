package com.electronics.service;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestInput {
    private final String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

    public int space(String input){
        int count = 0;
        for(int i = 0; i < input.length(); i++){
            char kt = input.charAt(i);
            if(Character.isSpace(kt)){
                count++;
            }
        }
        return count;
    }

    public String inputRamDom()
    {
        StringBuffer randStr = new StringBuffer();
        for(int i=0; i<8; i++)
        {
            int number = getRandomNumber();
            char ch = CHAR_LIST.charAt(number);
            randStr.append(ch);
        }
        return randStr.toString();
    }

    public int getRandomNumber()
    {
        int randomInt = 0;
        Random randomGenerator = new Random();
        randomInt = randomGenerator.nextInt(CHAR_LIST.length());
        if (randomInt - 1 == -1)
        {
            return randomInt;
        }
        else
        {
            return randomInt - 1;
        }
    }

    public boolean checkInput(String i){
        Pattern letter = Pattern.compile("[a-zA-z]");
        Pattern special = Pattern.compile ("[!@#$%&*()_+=|<>?{}\\[\\]~-]");
        Matcher hasLetter = letter.matcher(i);
        Matcher hasSpecial = special.matcher(i);
        return hasLetter.find() || hasSpecial.find();
    }

    public boolean isNumeric(String str) {
        return str.matches("-?\\d+(\\.\\d+)?");
    }

    public double formatMoney(String monney){
        return Double.parseDouble(monney.replace(",", ""));
    }
}
